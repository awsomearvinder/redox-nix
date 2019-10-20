{ unstable, callPackage, fetchgit, rust, fuse, pkgconfig, buildRustCrate, defaultCrateOverrides, config }:
let
  crates = callPackage ./Cargo.nix {
    buildRustCrate = unstable.buildRustCrate.override {
      rustc = rust;
    };
  };
in crates.rootCrate.build.overrideAttrs (_old: {
  src = config.srcFor "redoxfs" (fetchgit {
    url = https://gitlab.redox-os.org/redox-os/redoxfs;
    rev = "bede93c";
    sha256 = "1by15ysghazcvg2x60pryvq44xii9wm3wzqzb1n0kp2qj9llpgnx";
  });
})
