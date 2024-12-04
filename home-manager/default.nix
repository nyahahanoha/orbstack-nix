{ config, pkgs, home-manager, user, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user} = {
      imports = [ 
        ./programs
      ];

      home.username = "${user}";
      home.homeDirectory = "/home/${user}";
      home.stateVersion = "23.11";

      programs.home-manager.enable = true;

      home.packages = with pkgs; [
        # standard tools
        mdr
        pandoc
        pdf2svg
        texliveMedium
        unzip
        wget
        zip

        # control tools
        krew
        kubectl
        kubernetes-helm

        # environment tools
        devenv

        # networking tools
        dnsutils
        inetutils
        netcat
        nmap
        pssh
        rustscan

        # programing tools
        python3
        rustup
      ];
    };
  };
}
