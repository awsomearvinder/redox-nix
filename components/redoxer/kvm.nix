# Simple wrapper around qemu-kvm to make redoxer work correctly
{ stdenv, makeWrapper, qemu }:

stdenv.mkDerivation {
  name = "kvm-${qemu.version}";

  nativeBuildInputs = [ makeWrapper ];
  phases = ["wrapPhase"];
  wrapPhase = ''
    makeWrapper ${qemu}/bin/qemu-kvm $out/bin/kvm
  '';
}
