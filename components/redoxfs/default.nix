{ fetchgit, naersk, fuse, pkg-config }:
naersk.buildPackage {
  src = fetchgit {
    url = "https://gitlab.redox-os.org/redox-os/redoxfs";
    rev = "0.4.0";
    sha256 = "05d1bl64fka3n9w7y04s80iyxgm5wrbvvk3f71fw1y4azg380pgw";
  };
  nativeBuildInputs = [ fuse pkg-config ];
}
