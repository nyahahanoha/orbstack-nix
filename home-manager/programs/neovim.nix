{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      # standard plugins
      lexima-vim 
      
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
      
      syntax enable
      colorscheme dracula
      
      highlight Normal guibg=none
      highlight NonText guibg=none
      highlight Normal ctermbg=none
      highlight NonText ctermbg=none
    '';
  };
}
