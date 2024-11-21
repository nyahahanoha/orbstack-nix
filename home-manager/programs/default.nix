{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./go.nix
    ./neovim.nix
    ./shell.nix
    ./tmux.nix
  ];
}
