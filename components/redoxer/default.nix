{ root, callPackage, lib, fetchgit, rust, fuse, pkgconfig, makeWrapper, buildRustCrate, defaultCrateOverrides }:
let
  overrides = {
    cratesIO = callPackage ./crates-io.nix {};
    buildRustCrate = buildRustCrate.override {
      rustc = rust;
    };
  };

  crates = (callPackage ./redoxer.nix overrides);
  redoxer = (crates.redoxer {}).overrideAttrs (_old: {
    src = fetchgit {
      url = https://gitlab.redox-os.org/redox-os/redoxer;
      rev = "eeaf0be";
      sha256 = "199ngi3y7jywkhkjd4zbrzlpk255a4sbi2lp1h5095ash4y5r1ws";
    };
  });
  path = lib.makeBinPath [
    rust
    root.redoxfs
    (callPackage ./kvm.nix {})
  ];
in redoxer.override {
  crateOverrides = defaultCrateOverrides // {
    redoxer = _old: {
      nativeBuildInputs = [ makeWrapper ];
    };
    fuse = _old: {
      nativeBuildInputs = [ pkgconfig ];
      buildInputs = [ fuse ];
    };
  };

  postInstall = ''
    wrapProgram $out/bin/redoxer --prefix PATH : "${path}"
  '';
}
