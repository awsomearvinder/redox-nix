{
  fetchgit,
  naersk,
  fuse,
  pkg-config,
}:
naersk.buildPackage {
  src = fetchgit {
    url = "https://gitlab.redox-os.org/redox-os/redoxfs";
    rev = "63468fc4141e662ea91eb55e251ba9134d52b22b";
    sha256 = "IeBsqtAUWdqnyB3NYf9vA6ZUgESy5SMVmM0uHLFHYXI=";
  };
  nativeBuildInputs = [fuse pkg-config];
}
