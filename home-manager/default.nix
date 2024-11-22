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

      #_module.args = {
      #  inherit config;
      #  inherit pkgs;
      #};

      home.username = "${user}";
      home.homeDirectory = "/home/${user}";
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
        age
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
    };
  };
}
