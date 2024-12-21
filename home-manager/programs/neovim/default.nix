{ config, pkgs, ... }:
let
  mason-null-ls-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "mason-null-ls-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "jay-babu";
      repo = "mason-null-ls.nvim";
      rev = "2b8433f76598397fcc97318d410e0c4f7a4bea6a";
      sha256 = "sha256-EyOcThSnsT7YltYl/N0u24BjFA5fkYWpQouQwz61P8k=";
    };
  };
in
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      # standard plugins
      lexima-vim 

      # LSP control plugins
      none-ls-nvim
      mason-lspconfig-nvim
      mason-null-ls-nvim
      mason-nvim
      
      # thema plugins
      tokyonight-nvim
    ];
    extraLuaConfig = builtins.readFile ./init.lua;
    withNodeJs = true;
  };
}
