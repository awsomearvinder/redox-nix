{ pkgs_fn ? import <nixpkgs> }:

let
  pkgs = pkgs_fn { overlays = [
    (import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz))
  ]; };
  rust = (pkgs.rustChannelOf {
    date = "2019-06-17";
    channel = "nightly";
  }).rust;

  root = {
    redoxer = pkgs.callPackage ./redoxer {
      inherit rust root;
    };
    redoxfs = pkgs.callPackage ./redoxfs {
      inherit rust;
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
