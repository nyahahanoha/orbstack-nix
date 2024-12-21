{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./go.nix
    ./neovim
    ./shell
    ./tmux.nix
  ];
}
