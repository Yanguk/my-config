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

vim.filetype.add({
  extension = {
    http = "http", -- .http 파일을 http 파일타입으로 설정
  },
})

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})
