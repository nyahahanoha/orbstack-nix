{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      docker = "mac docker";
      kubectl = "mac kubectl";
      brew = "mac brew";
      arp-scan = "mac arp-scan";
      home = "cd /Users/\${USER}";
      ls = "ls -1 --color";
      la = "ls -a";
      ll = "ls -l";
      lla= "ls -la";
      orb= "mac";
      update = "sudo nixos-rebuild switch --flake /home/\${USER}/.config/nixos#\${USER}";
    };
    initExtraFirst = ''
      if [ -z $TMUX ]; then
        tmux new-session -A -s default; exit
      fi
    '';
    initExtra = ''
      function keyscan() {
        host=$1
        echo "delete $host from known_hosts"
        ssh-keygen -R $host
        echo "add $host to known_hosts"
        ssh-keyscan -H $host >> "$HOME"/.ssh/known_hosts
      }

      function uncomp() {
        type=$1
        path=$2
        if [ "$1" = "tar" ]; then
          tar -xvf $path
        elif [ "$1" = "zip" ]; then
          unzip $path
        elif [ "$1" = "gz" ]; then
          tar -zxvf $path
        elif [ "$1" = "bz2" ]; then
          tar -jxvf $path
        elif [ "$1" = "xz" ]; then
          tar -Jxvf $path
        else
          echo "not supported this file type"
        fi
      }
      
      precmd() {
        if [[ "$PWD" == /Users/* ]]; then
          fs_os="macos"
          color="blue"
        else
          fs_os="nixos"
          color="green"
        fi
        PROMPT="%F{"$color"}%B"$fs_os" >%b %f"
      }
      
      eval "$(gh completion -s zsh)"
      
      export LC_CTYPE="en_US.UTF-8"
    '';
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "brackets"
      ];
    };
  };
}
