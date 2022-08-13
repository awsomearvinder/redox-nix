{
  description = "Flake for redox";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };

    alejandra.url = "github:kamadorueda/alejandra/2.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";

    naersk-flake.url = "github:nix-community/naersk";
    naersk-flake.inputs.nixpkgs.follows = "nixpkgs";

    fenix-flake.url = "github:nix-community/fenix";
    fenix-flake.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    alejandra,
    naersk-flake,
    fenix-flake,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        (final: prev: {
          naersk = nixpkgs.legacyPackages.${system}.callPackage naersk-flake;
        })
        fenix-flake.overlay
      ];
    };
  in {
    devShell."${system}" = import ./shell.nix {inherit pkgs;};
    formatter."${system}" = alejandra.defaultPackage.${system};
  };
}
