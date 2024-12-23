{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      # orbstack only 
      docker = "mac docker";
      brew = "mac brew";
      arp-scan = "mac arp-scan";
      home = "cd /Users/\${USER}";
      orb= "mac";
      update = "sudo nixos-rebuild switch --flake /home/\${USER}/.config/nixos#\${USER}";

      # common aliases
      ls = "ls -1 --color";
      la = "ls -a";
      ll = "ls -l";
      lla= "ls -la";
      k = "kubectl";
      md2pdf = "pandoc --pdf-engine=lualatex -V documentclass=bxjsarticle -V classoption=pandoc";
    };
    initExtraFirst = ''
      if [ -z $TMUX ]; then
        tmux new-session -A -s default; exit
      fi
    '';
    initExtra = builtins.readFile ./zshrc;
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "brackets"
      ];
    };
  };
}
