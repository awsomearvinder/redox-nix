{ pkgsFn ? import <nixpkgs>, redoxer ? null, redoxfs ? null }:

let
  pkgs = pkgsFn { overlays = [
    (import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz))
  ]; };
  rust = (pkgs.rustChannelOf {
    date = "2019-06-17";
    channel = "nightly";
  }).rust;

  inherit (pkgs) lib;

  config = rec {
    sources = {
      inherit redoxer redoxfs;
    };
    srcFor = src: fn: if sources."${src}" == null
                      then fn
                      else lib.cleanSource (lib.cleanSourceWith {
                        filter = name: type: (baseNameOf (toString name)) != "target";
                        src = sources."${src}";
                      });
  };

  root = {
    redoxer = pkgs.callPackage ./redoxer {
      inherit rust root config;
    };
    redoxfs = pkgs.callPackage ./redoxfs {
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
