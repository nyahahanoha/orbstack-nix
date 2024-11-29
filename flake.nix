{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    user = "nyahahanoha";
    system = "aarch64-linux";
  in
  {
    nixosConfigurations.${user} = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit user;
        inherit system;
        inherit home-manager;
        inherit sops-nix;
      };
      modules = [
        ./configuration
        ./home-manager
      ];
    };
  };
}
