{ config, pkgs, ... }:
let
  preview-markdown = pkgs.vimUtils.buildVimPlugin {
    pname = "preview-markdown";
    version = "v1.0.0";
    src = builtins.fetchGit {
      url = "https://github.com/skanehira/preview-markdown.vim";
      rev = "ed472c0c04f0e312df2ffcd4eaafc91a5a8959cf";
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
      preview-markdown
      vimtex
      
      # programing plugins
      rust-vim

      # thema plugins
      dracula-vim
    ];
    extraConfig = ''
      set cursorline
      set number
      set clipboard+=unnamed
      set showmatch
      set wrap
      
      set autoindent
      set expandtab
      set ignorecase
      set smartcase
      
      set tabstop=2
      set shiftwidth=2
      
      inoremap <silent> jj <ESC>
      
      let g:rustfmt_autosave = 1
      let g:latex_latexmk_options = '-pdf'
      
      syntax enable
      colorscheme dracula
      
      highlight Normal guibg=none
      highlight NonText guibg=none
      highlight Normal ctermbg=none
      highlight NonText ctermbg=none
    '';
  };
}
