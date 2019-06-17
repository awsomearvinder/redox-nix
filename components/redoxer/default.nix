{ root, pkgs, lib, fetchgit, rust, fuse, pkgconfig, makeWrapper, defaultCrateOverrides }:
let
  overrides = {
    cratesIO = pkgs.callPackage ./crates-io.nix {};
    buildRustCrate = pkgs.buildRustCrate.override {
      rustc = rust;
    };
  };

  crates = (pkgs.callPackage ./redoxer.nix overrides);
  redoxer = (crates.redoxer {}).overrideAttrs (_old: {
    src = fetchgit {
      url = https://gitlab.redox-os.org/redox-os/redoxer;
      rev = "97fbcf4a";
      sha256 = "05918sz59zkhf16xq9ssv2wxar1sikp2lffd06hn2bc5wjy8dy5m";
    };
  });
  path = lib.makeBinPath [
    rust
    root.redoxfs
    (pkgs.callPackage ./kvm.nix {})
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
