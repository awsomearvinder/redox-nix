{
  pkgs ? import <nixpkgs>,
  ignoreOverrides ? false,
}: let
  naersk = pkgs.callPackage pkgs.naersk {
    rustc = pkgs.rust;
    cargo = pkgs.rust;
  };

  inherit (pkgs) lib;

  # The binary toolchain for gcc includes a symlink from $root/lib/rustlib/src/rust
  # to /home/redox/rust. Ofcourse, we don't know if /home/redox is where redox resides
  # so as a hack, we remove the original symlink from $root/lib/rustlib/src/rust ->
  # /home/redox/rust and replace it with a symlink to another derivation we make instead,
  # 'redox-rust', which is just the rust/ folder in ../redox
  binary-gcc-install-broken-rust = pkgs.callPackage ./binary-toolchain.nix {
    name = "gcc-install";
  };

  redox-rust = pkgs.stdenv.mkDerivation {
    name = "redox-rust";
    src = ../redox/rust;
    phases = ["unpackPhase" "installPhase"];
    installPhase = ''
      mkdir $out
      mv * $out/
    '';
  };

  binary-gcc-install = binary-gcc-install-broken-rust.overrideAttrs (old: {
    buildInputs = [
      redox-rust
    ];
    installPhase =
      old.installPhase
      + ''
        rm $out/lib/rustlib/src/rust
        ln -s ${redox-rust} "$out/lib/rustlib/src/rust"
      '';
  });

  binary-rust-install = pkgs.callPackage ./binary-toolchain.nix {
    name = "rust-install";
  };

  binary-relibc-install = pkgs.callPackage ./binary-toolchain.nix {
    name = "relibc-install";
  };
  root = {
    components = {
      redoxer = pkgs.callPackage ./redoxer {
        inherit naersk root;
      };
      redoxfs = pkgs.callPackage ./redoxfs {
        inherit naersk;
      };
      xargo = pkgs.callPackage ./xargo {
        inherit naersk;
      };
      config = pkgs.callPackage ./config {
        inherit naersk;
      };
    };
    inherit binary-rust-install;
    inherit binary-relibc-install;
    inherit binary-gcc-install;
  };
  # I think if we can get cargo to think ~/cargo/.bin is this folder we'll be set.
  # cargo install --list should pickup these assuming that holds true. That means
  # custom packaging cargo? I wonder how easy / feasible that is and if I could upstream
  # it to nixpkgs. That might require buildFHSUserEnv though. Another possibility is
  # potentially seeing if cargo could potentially accept a enviornment variable to change
  # the path of ~/cargo/.bin to something in the nix store. The final option is just not
  # using cargo install --list to figure out if these components are installed in the makefile.
in {
  cargo-components = pkgs.stdenv.mkDerivation {
    name = "cargo_components";
    phases = ["installPhase"];
    # right now we just include all the components.
    buildInputs = builtins.attrValues root.components;
    installPhase = ''
      mkdir -p $out/bin
      for p in $buildInputs; do
        ln -s  $p/bin/* $out/bin
      done
    '';
  };
  inherit (root) binary-gcc-install binary-rust-install binary-relibc-install;
}
