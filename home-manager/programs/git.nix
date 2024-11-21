{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "nyahahanoha";
    userEmail = "nyahahanoha.pc@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.gh = {
    enable = true;
    settings.git-protocol = "ssh";
  };
}
