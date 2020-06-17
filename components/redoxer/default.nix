{ callPackage, root, lib, fetchgit, rust, fuse, pkgconfig, makeWrapper, buildRustCrate, defaultCrateOverrides, config }:
let
  crates = callPackage ./Cargo.nix {
    buildRustCrate = buildRustCrate.override {
      rustc = rust;
    };
  };
  path = lib.makeBinPath [
    (toString ~/.redoxer/toolchain)
    root.redoxfs
  ];
in crates.rootCrate.build.overrideAttrs (_old: {
  src = config.srcFor "redoxer" (fetchgit {
    url = "https://gitlab.redox-os.org/redox-os/redoxer";
    rev = "0.2.19";
    sha256 = "0lakv5qg1qz0k0iw6p7i8mp97gbkiwn2723a0c1kiv7llaznv4l5";
  });
  nativeBuildInputs = [ makeWrapper ];
  postInstall = ''
    wrapProgram $out/bin/redoxer \
      `# add necessary runtime PATH` \
      --prefix PATH : "${path}"
  '';
})
