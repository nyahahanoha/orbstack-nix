{ config, pkgs, user, system, sops-nix, ... }@inputs:
{
  #imports = [ agenix.nixosModules.default ];
  #environment.systemPackages = [ agenix.packages.${system}.default ];

  #age = {
  #  identityPaths = builtins.path { path = "/etc/ssh/id_rsa"; };
  #  #identityPaths = [ ./ssh-key.age ];
  #  secrets.ssh-config.file = ./ssh-config.age;
  #};
  imports = [ sops-nix.nixosModules.sops ];
}
