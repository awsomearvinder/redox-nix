{ pkgs ? import <nixpkgs> {} }:

let
  inherit (pkgs) mkShell lib stdenv;

  prefix = redox/prefix/x86_64-unknown-redox;

  path_prefix = lib.makeBinPath [
    # Nix can't supply the fusermount binary because it is setuid
    (toString /run/wrappers)
    (toString (prefix + "/relibc-install/"))
  ];
in mkShell rec {
  hardeningDisable = [ "all" ];

  nativeBuildInputs = with pkgs; [ gnumake cmake nasm pkgconfig gcc automake autoconf bison gperf qemu rustup ];
  buildInputs = with pkgs; [ fuse openssl gettext libtool flex libpng perl perlPackages.HTMLParser ];

  LIBRARY_PATH = lib.makeLibraryPath [
    pkgs.gcc-unwrapped stdenv.cc.libc
    (toString prefix)
  ];
  LD_LIBRARY_PATH = LIBRARY_PATH;

  shellHook = ''
    export PATH="${path_prefix}:$PATH"
    ./prepare.sh
  '';
}
