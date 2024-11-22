{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./go.nix
    ./neovim.nix
    ./shell.nix
    #./ssh.nix
    ./tmux.nix
  ];

  #_module.args = {
  #  inherit config;
  #  inherit pkgs;
  #};

}
