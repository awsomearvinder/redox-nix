{
  pkgsFn ? import <nixpkgs>,
  ignoreOverrides ? false,
}:

let
  overlays = [
    (import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz))
    (self: super: {
      rust = (self.rustChannelOf {
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

  config = rec {
    sources = if builtins.pathExists ../my-overrides.nix && !ignoreOverrides
              then import ../my-overrides.nix
              else {};
    srcFor =
      if builtins.all (p: builtins.elem p ["redoxer" "redoxfs"]) (builtins.attrNames sources)
      then src: fn: if sources ? "${src}"
                    then lib.cleanSource (lib.cleanSourceWith {
                      filter = name: type: (baseNameOf (toString name)) != "target";
                      src = /. + sources."${src}";
                    })
                    else fn
      else throw "One of the elements in my-overrides.nix was not an overridable package";
  };

  root = {
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
in root
