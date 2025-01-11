local opt = vim.opt
local o = vim.o
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd
g.mapleader = " "

------
o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

o.termguicolors = true
opt.wrap = false
opt.whichwrap:append("<>[]hl")

-- disable nvim intro
opt.shortmess:append("sI")

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

opt.swapfile = false -- don't create backup files

local disabled_built_ins = {
  "2html_plugin",
  "tohtml",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
  "netrw_nogx",
  "node_provider",
  "python3_provider",
  "perl_provider",
  "ruby_provider",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

vim.filetype.add({
  extension = {
    http = "http", -- .http 파일을 http 파일타입으로 설정
  },
})

vim.treesitter.language.add("markdown") -- cmp docs type

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})
