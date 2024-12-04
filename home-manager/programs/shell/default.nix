{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      docker = "mac docker";
      brew = "mac brew";
      arp-scan = "mac arp-scan";
      home = "cd /Users/\${USER}";
      ls = "ls -1 --color";
      la = "ls -a";
      ll = "ls -l";
      lla= "ls -la";
      orb= "mac";
      update = "sudo nixos-rebuild switch --flake /home/\${USER}/.config/nixos#\${USER}";
      k = "kubectl";
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
