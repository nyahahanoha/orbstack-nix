{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./go.nix
    ./neovim.nix
    ./shell
    ./tmux.nix
  ];
}
