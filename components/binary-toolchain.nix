{
  stdenv,
  lib,
  gcc-unwrapped,
  name,
}: let
  rpath = lib.makeLibraryPath [
    gcc-unwrapped
    stdenv.cc.libc
    "$out"
  ];
in
  stdenv.mkDerivation {
    name = "binary-${name}-latest";
    src = builtins.fetchurl (https://static.redox-os.org/toolchain/x86_64-unknown-redox/ + name + ".tar.gz");

    unpackPhase = ''
      tar -xzvf $src
    '';
    dontBuild = true;
    dontPatchELF = true;
    dontStrip = true;
    installPhase = ''
      source $stdenv/setup

      mkdir $out/
      mv * $out/

      find $out/ -executable -type f -exec patchelf \
          --set-interpreter "${stdenv.cc.libc}/lib/ld-linux-x86-64.so.2" \
          --set-rpath "${rpath}" \
          "{}" \;
      find $out/ -name "*.so" -type f -exec patchelf \
          --set-rpath "${rpath}" \
          "{}" \;
    '';
  }
