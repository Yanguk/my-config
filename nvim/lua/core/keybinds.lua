local function map(m, k, v, option)
	local opts = option or { noremap = true, silent = true }

  vim.keymap.set(m, k, v, opts)
end

vim.g.mapleader = ","

map('n', '<leader>ww', ':w<CR>')
map('n', '<leader>wq', ':wq<CR>')

map('n', '<leader><CR>', ':noh<CR>')

map('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')
map('n', '<leader>cl', ':let @+=expand("%p:h")<CR>:pwd<CR>')

map('n', '<leader>pp', ':setlocal paste!<CR>')

map('n', '<leader>nn', ':NvimTreeToggle<CR>')
map('n', '<leader>nc', ':NvimTreeFocus<CR>')
map('n', '<leader>nr', ':NvimTreeCollapse<CR>')
map('n', '<leader>nf', ':NvimTreeFindFile<CR>')

-- spell
-- map('n', '<leader>ss', ':setlocal spell!<CR>')

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

map('n', '<leader>bp', ':bp<CR>')
map('n', '<leader>bn', ':bn<CR>')
map('n', '<leader>bl', ':bl<CR>')
map('n', '<leader>ls', ':ls<CR>')

map('n', '<leader>qq', ':q<CR>')
map('n', '<leader>qd', ':BufDel<CR>')
map('n', '<leader>qD', ':BufDel!<CR>')
map('n', '<leader>qa', ':BufDelAll<CR>')
map('n', '<leader>qr', ':BufDelOthers<CR>')

map('n', '<leader>gg', ':G<CR>:resize 15<CR>', { silent = true })
map('n', '<leader>gs', ':G status<CR>')
map('n', '<leader>gb', ':G branch ')
map('n', '<leader>gl', ':G log --oneline ')
map('n', '<leader>gw', ':G switch ')

map('n', '<leader>zm', ':ZenMode<CR>')

-- iconPicker
map("n", "<Leader>ip", "<cmd>IconPickerNormal<cr>")
-- map("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
-- map("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
