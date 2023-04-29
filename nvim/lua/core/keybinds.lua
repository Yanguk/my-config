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

map('n', '<leader>nn', ':NERDTreeToggle<CR>')
map('n', '<leader>nb', ':NERDTreeFromBookmark')
map('n', '<leader>nf', ':NERDTreeFind<CR>')

map('n', '<leader>z', ':Goyo<CR>')
map('n', '<leader>d', ':GitGutterToggle<CR>')

-- spell
map('n', '<leader>ss', ':setlocal spell!<CR>')

-- 주석
map("n", "<leader>/", ":CommentToggle <CR>")

-- 괄호 편하게 하기 위함
map('v', '$1', '<esc>`>a)<esc>`<i(<esc>')
map('v', '$2', '<esc>`>a]<esc>`<i[<esc>')
map('v', '$3', '<esc>`>a}<esc>`<i{<esc>')
map('v', '$$', '<esc>`>a"<esc>`<i"<esc>')
map('v', '$q', '<esc>`>a\'<esc>`<i\'<esc>')
map('v', '$e', '<esc>`>a"<esc>`<i"<esc>')

map('i', '$1', '()<esc>i')
map('i', '$2', '[]<esc>i')
map('i', '$3', '{}<esc>i')
map('i', '$4', '{<esc>o}<esc>O')
map('i', '$q', '\'\'<esc>i')
map('i', '$e', '""<esc>i')
map('i', '$t', '<><esc>i')

-- buffer
map('n', '<leader>o', ':BufExplorer<CR>')

vim.g.ctrlp_map = '<C-f>'
map('n', '<leader>j', ':CtrlPBuffer<CR>')
-- map('n', '<leader>bp', ':bp<CR>')
-- map('n', '<leader>bn', ':bn<CR>')
-- map('n', '<leader>ls', ':ls<CR>')
