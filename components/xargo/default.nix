{
  fetchFromGitHub,
  naersk,
  ...
}:
naersk.buildPackage {
  src = fetchFromGitHub {
    owner = "japaric";
    repo = "xargo";
    rev = "v0.3.20";
    sha256 = "1syanz7ybqjbsvk1q537bnm414skj4ff41yamrl4fz1rrkz576n4";
  };
}
