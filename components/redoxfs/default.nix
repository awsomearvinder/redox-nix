{ pkgs, fetchgit, rust, fuse, pkgconfig, defaultCrateOverrides }:
let
  overrides = {
    cratesIO = pkgs.callPackage ./crates-io.nix {};
    buildRustCrate = pkgs.buildRustCrate.override {
      rustc = rust;
    };
  };

  crates = (pkgs.callPackage ./redoxfs.nix overrides);
  redoxfs = (crates.redoxfs {}).overrideAttrs (_old: {
    src = fetchgit {
      url = https://gitlab.redox-os.org/redox-os/redoxfs;
      rev = "a70a01bd";
      sha256 = "121cz2rr3592rwrmihhwbg6xwabnja6f9gymmsm6lr6mhi73qn2f";
    };
  });
in redoxfs.override {
  crateOverrides = defaultCrateOverrides // {
    fuse = _old: {
      nativeBuildInputs = [ pkgconfig ];
      buildInputs = [ fuse ];
    };
  };
}
