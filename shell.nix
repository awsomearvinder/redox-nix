{ pkgs ? import <nixpkgs> {} }:

let
  inherit (pkgs) mkShell lib stdenv;

  prefix = redox/prefix/x86_64-unknown-redox;
  relibcInstall = prefix + "/relibc-install";

  targetTriple = "x86_64-unknown-redox";
  targetTripleUnderscore = builtins.replaceStrings ["-"] ["_"] targetTriple;

  components = pkgs.callPackage ./components {};

  pathPrefix = pkgs.lib.makeBinPath [
    "/run/wrappers"
    (toString relibcInstall)
  ];

  gdb-init = pkgs.writers.writeBashBin "gdb" ''
    if [ "$#" == 0 ]; then
      "${pkgs.gdb}/bin/gdb" \
        -ex "symbol-file ${toString redox/build/kernel.sym}" \
        -ex "set pagination off" \
        -ex "echo \n======================================\n" \
        -ex "echo   To connect to the Redox OS kernel, use\n" \
        -ex "echo   (gdb) target remote localhost:1234\n" \
        -ex "echo   ======================================\n\n" \
        -ex "set pagination on"
    else
      "${pkgs.gdb}/bin/gdb" "$@"
    fi
  '';
  redox-copy-c = pkgs.writers.writeBashBin "redox-copy-c" ''
    : ''${1:?redox-copy-c <path/to/file.c>}

    cleanup() {
      make unmount
      rm "$file"
    }
    trap 'cleanup; exit 1' SIGINT

    file="$(mktemp || exit 1)"
    x86_64-unknown-redox-gcc -g -static $1 -o "$file" || exit 1

    make mount || exit 1

    basename="$(basename "$1" | cut -d'.' -f1)"
    install -m 0755 "$file" "${toString redox/build/filesystem/bin}/$basename"

    cleanup
  '';
  redox-relibc-tests = pkgs.writers.writeBashBin "redox-relibc-tests" ''
    make test \
      TARGET=x86_64-unknown-redox \
      PATH="${toString relibcInstall}:$PATH" \
      TEST_RUNNER="redoxer exec --folder . -- sh --"
  '';
in mkShell rec {
  hardeningDisable = [ "all" ];

  nativeBuildInputs = with pkgs; [
    # Cargo packages
    components.redoxfs
    components.redoxer
    components.xargo

    # All external packages that need to be put in $PATH
    autoconf automake bison cmake gcc gnumake gperf nasm pkgconfig
    qemu rustup

    # All internal packages that need to be put in $PATH
    gdb-init
    redox-relibc-tests
    redox-copy-c

    # Packages that are needed to make the iso/live images
    cdrkit syslinux
    autogen
  ];

  # All packages that need to be installed as libraries
  buildInputs = with pkgs; [
    flex fuse gettext libpng libtool openssl perl
    perlPackages.HTMLParser
  ];

  LIBRARY_PATH = lib.makeLibraryPath [
    pkgs.gcc-unwrapped stdenv.cc.libc
    (toString prefix)
  ];

  # Taken from mk/config.mk
  REDOXER_TOOLCHAIN     = toString relibcInstall;
  RUST_COMPILER_RT_ROOT = toString redox/rust/src/llvm-project/compiler-rt;
  RUST_TARGET_PATH      = toString redox/kernel/targets;
  XARGO_HOME            = toString redox/build/xargo;
  XARGO_RUST_SRC        = toString redox/rust/src;
  # TARGET = ...
  "AC_${targetTripleUnderscore}" = "${targetTriple}-ac";
  "CC_${targetTripleUnderscore}" = "${targetTriple}-gcc";
  "CXX_${targetTripleUnderscore}" = "${targetTriple}-g++";

  SHELL_HOOK = ''
    export PATH="${pathPrefix}:$PATH"
    export PATH="$PATH:~/.cargo/bin"
    ${toString ./prepare.sh}
  '';
}
