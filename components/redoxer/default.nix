{
  fetchgit,
  makeWrapper,
  naersk,
  lib,
  fuse,
  pkg-config,
  ...
}: (naersk.buildPackage {
  src = fetchgit {
    url = "https://gitlab.redox-os.org/redox-os/redoxer";
    rev = "ebac2a6c9e60ae4d7c2594ad7f4d2e9515dcc966";
    sha256 = "LT8oC/mn+u3WZnCv5xO24DG7NChFP91wwjWtMGWznJ8=";
  };
  nativeBuildInputs = [makeWrapper fuse pkg-config];
  #postInstall = ''
  #  wrapProgram $out/bin/redoxer \
  #    `# add necessary runtime PATH` \
  #    --prefix PATH : "${}"
  #'';
})
