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
    rev = "b6dbd93dae60fa3d3734af1390d877bbbcbe399a";
    sha256 = "q6766zir+BDENl6PvMN440Aq5qqYmV01qoF+p6AWD2U=";
  };
  nativeBuildInputs = [makeWrapper fuse pkg-config];
  #postInstall = ''
  #  wrapProgram $out/bin/redoxer \
  #    `# add necessary runtime PATH` \
  #    --prefix PATH : "${}"
  #'';
})
