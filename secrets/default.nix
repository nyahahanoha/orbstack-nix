{ config, pkgs, user, system, sops-nix, ... }@inputs:
{
  imports = [ sops-nix.nixosModules.sops ];
}
