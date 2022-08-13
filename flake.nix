{
  description = "Flake for redox";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };

    alejandra.url = "github:kamadorueda/alejandra/2.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    alejandra,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    devShell."${system}" = import ./shell.nix {inherit pkgs;};
    formatter."${system}" = alejandra.defaultPackage.${system};
  };
}
