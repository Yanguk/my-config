local vim = vim
local g = vim.g
local o = vim.o

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

-- show trailing whitespaces
vim.cmd('highlight ExtraWhitespace ctermbg=red guibg=red')
vim.cmd('match ExtraWhitespace /\\s\\+$/')

-- muti cursor
g.multi_cursor_use_default_mapping = 0
g.multi_cursor_start_word_key = '<C-s>'
g.multi_cursor_select_all_word_key = '<A-s>'
g.multi_cursor_start_key = 'g<C-s>'
g.multi_cursor_select_all_key = 'g<A-s>'
g.multi_cursor_next_key = '<C-s>'
g.multi_cursor_prev_key = '<C-p>'
g.multi_cursor_skip_key = '<C-x>'
g.multi_cursor_quit_key = '<Esc>'

-- spell
vim.opt.spelllang = { 'en_us' }
vim.opt.spell = false

-- color
vim.o.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 자동 줄바꿈 방지
vim.opt.wrap = false
vim.opt.formatoptions:remove { "c", "r", "o", "w" }

-- fold
vim.opt.fillchars = { fold = " " }
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
g.markdown_folding = 1 -- enable markdown folding

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- local M = {}
-- -- function to create a list of commands and convert them to autocommands
-- -------- This function is taken from https://github.com/norcalli/nvim_utils
-- function M.nvim_create_augroups(definitions)
--     for group_name, definition in pairs(definitions) do
--         vim.api.nvim_command('augroup '..group_name)
--         vim.api.nvim_command('autocmd!')
--         for _, def in ipairs(definition) do
--             local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
--             vim.api.nvim_command(command)
--         end
--         vim.api.nvim_command('augroup END')
--     end
-- end


-- local autoCommands = {
--     -- other autocommands
--     open_folds = {
--         {"BufReadPost,FileReadPost", "*", "normal zR"}
--     }
-- }

-- M.nvim_create_augroups(autoCommands)
