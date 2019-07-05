{ pkgs ? import <nixpkgs> {} }:

let
  inherit (pkgs) mkShell lib stdenv;

  prefix = redox/prefix/x86_64-unknown-redox;

  components = if builtins.pathExists ./my-components.nix
               then import ./my-components.nix {
                 components = import ./components {};
               }
               else null;

  gdb-init = pkgs.writers.writeBashBin "gdb" ''
    "${pkgs.gdb}/bin/gdb" \
      -ex "symbol-file ${toString redox/build/kernel.sym}" \
      -ex "set pagination off" \
      -ex "echo \n======================================\n" \
      -ex "echo   To connect to the Redox OS kernel, use\n" \
      -ex "echo   (gdb) target remote localhost:1234\n" \
      -ex "echo   ======================================\n\n" \
      -ex "set pagination on"
  '';
in mkShell rec {
  hardeningDisable = [ "all" ];

  nativeBuildInputs = with pkgs; [
    # All external packages that need to be put in $PATH
    autoconf automake bison cmake gcc gnumake gperf nasm pkgconfig
    qemu rustup

    # All internal packages that need to be put in $PATH
    gdb-init
    (toString (prefix + "/relibc-install/"))
  ] ++ components;

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
  RUST_COMPILER_RT_ROOT = toString redox/rust/src/llvm-project/compiler-rt;
  RUST_TARGET_PATH      = toString redox/kernel/targets;
  XARGO_HOME            = toString redox/build/xargo;
  XARGO_RUST_SRC        = toString redox/rust/src;
  TARGET = "x86_64-unknown-redox";
  "AC_${builtins.replaceStrings ["-"] ["_"] TARGET}" = "${TARGET}-ac";
  "CC_${builtins.replaceStrings ["-"] ["_"] TARGET}" = "${TARGET}-gcc";
  "CXX_${builtins.replaceStrings ["-"] ["_"] TARGET}" = "${TARGET}-g++";

  shellHook = ''
    # Nix can't supply the fusermount binary because it is setuid.
    export PATH="/run/wrappers/bin:$PATH"
    ${toString ./prepare.sh}
  '';
}
