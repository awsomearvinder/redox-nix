{ root, callPackage, lib, fetchgit, rust, fuse, pkgconfig, makeWrapper, buildRustCrate, defaultCrateOverrides, config }:
let
  overrides = {
    cratesIO = callPackage ./crates-io.nix {};
    buildRustCrate = buildRustCrate.override {
      rustc = rust;
    };
  };

  crates = (callPackage ./redoxer.nix overrides);
  redoxer = (crates.redoxer {}).overrideAttrs (_old: {
    src = config.srcFor "redoxer" (fetchgit {
      url = https://gitlab.redox-os.org/redox-os/redoxer;
      rev = "0.2.6";
      sha256 = "0q61vmy21gm88y5ajqcpcp6v9xca1v52fycvpi0yq36g8jw78vfh";
    });
  });
  path = lib.makeBinPath [
    (toString ~/.redoxer/toolchain)
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
