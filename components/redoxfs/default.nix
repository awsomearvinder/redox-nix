{ fetchgit, naersk, fuse, pkg-config }:
naersk.buildPackage {
  src = fetchgit {
    url = "https://gitlab.redox-os.org/redox-os/redoxfs";
    rev = "25be3a82bd881d6e778e72ed1451f2b2a10369a8";
    sha256 = "WX3ynuH3plOlK0osg29F/uNq5zevv1F/ZV46x0DDp2c=";
  };
  nativeBuildInputs = [ fuse pkg-config ];
}
