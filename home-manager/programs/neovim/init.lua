-- function
local getKeys = function(inputTable)
  local outputTable = {}
  for k, _ in pairs(inputTable) do
    table.insert(outputTable, k)
  end
end

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
require("mason").setup()

local lspEnsured = {
  lua_ls = {},
  rust_analyzer = {}
}

require("mason-lspconfig").setup {
  ensure_installed = getKeys(lspEnsured),
  handlers = {},
}
for k, v in pairs(lspEnsured) do
  require("lspconfig")[k].setup(v)
end

require("mason-null-ls").setup{
  ensure_installed = {
    "jq",
    "stylua",
    "markdownlint",
    "shfmt",
  },
  handlers = {},
}

