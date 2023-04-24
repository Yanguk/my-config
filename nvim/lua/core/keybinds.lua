local function map(m, k, v, option)
  vim.keymap.set(m, k, v, option or {})
end

vim.g.mapleader = ","

map('n', '<leader>w', ':w!<CR>')
map('n', '<leader><CR>', ':noh<CR>')

map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')

-- tab
map('n', '<leader>tn', ':tabnew<CR>')
map('n', '<leader>to', ':tabonly<CR>')
map('n', '<leader>tc', ':tabclose<CR>')
map('n', '<leader>tm', ':tabmove')
map('n', '<leader>tb', ':gt<CR>')
map('n', '<leader>tp', ':gT<CR>')
map('n', '<leader>te', ':tabedit <C-r>=escape(expand("%:p:h"), " ")<CR>/')

map('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')
map('n', '<leader>cl', ':let @+=expand("%p:h")<CR>:pwd<CR>')

map('n', '<leader>g', ':Ack')

map('n', '<leader>pp', ':setlocal paste!<CR>')

map('n', '<leader>bp', ':bp<CR>')
map('n', '<leader>bn', ':bn<CR>')
map('n', '<leader>ls', ':ls<CR>')
map('n', '<leader>o', ':BufExplorer<CR>')

map('n', '<leader>nn', ':NERDTreeToggle<CR>')
map('n', '<leader>nb', ':NERDTreeFromBookmark')
map('n', '<leader>nf', ':NERDTreeFind<CR>')

map('n', '<leader>z', ':Goyo<CR>')
map('n', '<leader>d', ':GitGutterToggle<CR>')

-- spell
map('n', '<leader>ss', ':setlocal spell!<CR>')

-- 주석
map("n", "<leader>/", ":CommentToggle <CR>")

