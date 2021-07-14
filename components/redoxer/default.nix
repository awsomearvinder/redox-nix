{ fetchgit, makeWrapper, naersk, lib, fuse, pkg-config, ...}:
(naersk.buildPackage {
  src = (fetchgit {
    url = "https://gitlab.redox-os.org/redox-os/redoxer";
    rev = "0.2.19";
    sha256 = "0lakv5qg1qz0k0iw6p7i8mp97gbkiwn2723a0c1kiv7llaznv4l5";
  });
  nativeBuildInputs = [ makeWrapper fuse pkg-config ];
  #postInstall = ''
  #  wrapProgram $out/bin/redoxer \
  #    `# add necessary runtime PATH` \
  #    --prefix PATH : "${}"
  #'';
})
