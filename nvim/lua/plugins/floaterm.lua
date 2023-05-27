vim.g.floaterm_width = 0.95
vim.g.floaterm_height = 0.95
vim.keymap.set('n', '<leader>g', ':FloatermNew lazygit<CR>')
vim.keymap.set('n', '<leader>ft', ':FloatermNew <CR>')
vim.keymap.set('t', '<leader>ft', '<C-\\><C-n>:FloatermNew <CR>')

vim.keymap.set('n', '<leader>tt', ':FloatermToggle <CR>')
vim.keymap.set('t', '<leader>tt', '<C-\\><C-n>:FloatermToggle<CR>')

vim.keymap.set('t', '<leader>tn', '<C-\\><C-n>:FloatermNext<CR>')
vim.keymap.set('t', '<leader>tp', '<C-\\><C-n>:FloatermPrev<CR>')
vim.keymap.set('t', '<leader>tq', '<C-\\><C-n>:FloatermKill<CR>')
