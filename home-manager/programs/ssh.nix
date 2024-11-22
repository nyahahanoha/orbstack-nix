{ config, pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    #extraConfig = builtins.readFile config.age.secretes.ssh-config.path;
  };
}
