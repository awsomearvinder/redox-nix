{ config }:

self: super:

with super; {
  defaultCrateOverrides = defaultCrateOverrides // {
    fuse = _old: {
      nativeBuildInputs = [ pkgconfig ];
      buildInputs = [ fuse ];
    };
  };
}
