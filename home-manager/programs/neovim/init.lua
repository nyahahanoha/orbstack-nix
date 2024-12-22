-- common configuration
local commonOptions = {
  cursorline = true,
  number = true,
  showmatch = true,
  wrap = true,
  splitright = true,

  ignorecase = true, smartcase = true, wrapscan = true,

  expandtab = true,
  tabstop = 2,
  shiftwidth = 2
}

for k, v in pairs(commonOptions) do
  vim.opt[k] = v
end

vim.opt.clipboard:append({unnamedeplus = true})

-- keymap configuration
local keymapOptions = {
  {'n', '<ESC><ESC>', ':<C-u>set nohlsearch!<CR>'},
  {'i', 'jj', '<ESC>'},
}

for _, v in pairs(keymapOptions) do
  vim.keymap.set(v[1], v[2], v[3])
end

-- thema configuration
require("tokyonight").setup{
    transparent = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent",
    },
}
vim.cmd([[colorscheme tokyonight-moon]])

-- language 
local lspEnsuredTools = {
  'lua_ls',
  'rust_analyzer',
}
local formatterEnsuredTools = {
  'jq',
  'stylua',
  'markdownlint',
  'shfmt'
}

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = lspEnsuredTools,
  handlers = {},
}
require("mason-null-ls").setup{
  ensure_installed = formatterEnsuredTools,
  handlers = {},
}
