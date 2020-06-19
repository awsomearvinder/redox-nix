{ callPackage, fetchgit, rust, buildRustCrate, config }:
let
  crates = callPackage ./Cargo.nix {
    buildRustCrate = buildRustCrate.override {
      rustc = rust;
    };
  };
in crates.rootCrate.build.overrideAttrs (_old: {
  src = config.srcFor "redoxfs" (fetchgit {
    url = "https://gitlab.redox-os.org/redox-os/redoxfs";
    rev = "0.4.0";
    sha256 = "05d1bl64fka3n9w7y04s80iyxgm5wrbvvk3f71fw1y4azg380pgw";
  });
})
