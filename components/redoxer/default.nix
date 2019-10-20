{ unstable, callPackage, root, lib, fetchgit, rust, fuse, pkgconfig, makeWrapper, buildRustCrate, defaultCrateOverrides, config }:
let
  crates = callPackage ./Cargo.nix {
    buildRustCrate = unstable.buildRustCrate.override {
      rustc = rust;
    };
  };
  path = lib.makeBinPath [
    (toString ~/.redoxer/toolchain)
    root.redoxfs
    (callPackage ./kvm.nix {})
  ];
in crates.rootCrate.build.overrideAttrs (_old: {
  src = config.srcFor "redoxer" (fetchgit {
    url = https://gitlab.redox-os.org/redox-os/redoxer;
    rev = "0.2.9";
    sha256 = "0jwp3albhhbk5j0awn0fhb46sz9cjlra9b2kji6fb2gkndqjw7yi";
  });
  nativeBuildInputs = [ makeWrapper ];
  postInstall = ''
    wrapProgram $out/bin/redoxer \
      `# redox installer uses $TARGET` \
      --set TARGET x86_64-unknown-redox \
      `# add necessary runtime PATH` \
      --prefix PATH : "${path}"
  '';
})
