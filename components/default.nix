{
  pkgsFn ? import <nixpkgs>,
  ignoreOverrides ? false,
}:

let
  overlays = [
    (import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz))
    (self: super: {
      rust = (super.rustChannelOf {
        date = "2019-11-25";
        channel = "nightly";
      }).rust;
    })
    (self: super: {
      naersk = (import (self.fetchFromGitHub {
        owner = "nmattia";
        repo = "naersk";
        rev = "e09c320446c5c2516d430803f7b19f5833781337";
        sha256 = "sGxlmfp5eXL5sAMNqHSb04Zq6gPl+JeltIZ226OYN0w=";
      }));
    })
   ];

  pkgs = pkgsFn { inherit overlays; };

  naersk = pkgs.callPackage pkgs.naersk {
    rustc = pkgs.rust;
    cargo = pkgs.rust;
  };

  inherit (pkgs) lib;

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
    binary-gcc-install = pkgs.callPackage ./binary-toolchain.nix {
      name = "gcc-install";
    };
    binary-rust-install = pkgs.callPackage ./binary-toolchain.nix {
      name = "rust-install";
    };
    binary-relibc-install = pkgs.callPackage ./binary-toolchain.nix {
      name = "relibc-install";
    };
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
    phases = [ "installPhase" ];
    # right now we just include all the components.
    buildInputs = builtins.attrValues root.components;
    installPhase = ''
      mkdir -p $out/bin
      for p in $buildInputs; do
        ln -s  $p/bin/* $out/bin
      done
    '';
  };
  inherit (root) binary-gcc-install binary-rust-install relibc-install;
}
