{
  pkgsFn ? import <nixpkgs>,
  ignoreOverrides ? false,
}:

let
  overlays = [
    (import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz))
    (import ./overlays/crate-overrides.nix { inherit config; })
  ];
  pkgs = pkgsFn { inherit overlays; };
  rust = (pkgs.rustChannelOf {
    date = "2019-11-25";
    channel = "nightly";
  }).rust;

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
      inherit rust root config;
    };
    redoxfs = pkgs.callPackage ./redoxfs {
      inherit rust config;
    };
    xargo = pkgs.callPackage ./xargo {
      inherit rust config;
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
