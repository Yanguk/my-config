local g = vim.g
local o = vim.o

vim.cmd('syntax on')
vim.cmd('set noswapfile')

vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.cursorline = true
vim.opt.autoindent = true
vim.opt.hlsearch = true

-- set options for Rust files
vim.cmd('autocmd FileType rust setlocal shiftwidth=4 tabstop=4')
-- split view settings
vim.opt.splitbelow = true
vim.opt.splitright = true

-- don't create backup files
vim.opt.swapfile = false

-- indent guides settings
vim.g.indent_guides_enable_on_vim_startup = true
vim.g.indent_guides_start_level = 2
vim.g.indent_guides_guide_size = 1

-- show trailing whitespaces
vim.cmd('highlight ExtraWhitespace ctermbg=red guibg=red')
vim.cmd('match ExtraWhitespace /\\s\\+$/')

-- muti cursor
g.multi_cursor_use_default_mapping = 0
g.multi_cursor_start_word_key = '<C-s>'
g.multi_cursor_next_key = '<C-s>'
g.multi_cursor_prev_key = '<C-p>'
g.multi_cursor_skip_key = '<C-x>'
g.multi_cursor_quit_key = '<Esc>'

-- buffer
g.ctrlp_map = '<C-f>'

-- goyo
g.goyo_width=100
g.goyo_margin_top = 2
g.goyo_margin_bottom = 2

-- spell
vim.opt.spelllang = { 'en_us' }
vim.opt.spell = true
