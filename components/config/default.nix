{
  fetchFromGitHub,
  naersk,
  ...
}:
naersk.buildPackage {
  src = fetchFromGitHub {
    owner = "wesleywiser";
    repo = "cargo-config";
    rev = "cf576faf65913615ed424914daa960800ed3ebc4";
    sha256 = "HrITNTfjBppOH1MhfZHfzHc6N8ymcm7vaiBI94ctUOA=";
  };
  targets = ["x86_64-unknown-linux-gnu"];
}
