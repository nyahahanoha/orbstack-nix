{ config, pkgs, ... }:
{

  imports = [
    ./programs
  ];
  home.username = "nyahahanoha";
  home.homeDirectory = "/home/nyahahanoha";
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # standard tools
    pdf2svg

    # networking tools
    dnsutils
    inetutils
    netcat
    nmap
    rustscan

    # programing tools
    python3
    rustup
  ];

}
