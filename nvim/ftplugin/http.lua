vim.api.nvim_set_keymap("n", "<leader>kp", ":lua require('kulala').jump_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>kn", ":lua require('kulala').jump_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>kr", ":lua require('kulala').run()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>kl", ":lua require('kulala').replay()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>ke",
  ":lua require('kulala').set_selected_env()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>rs", ":lua require('kulala').scratchpad()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>kv",
  ":lua require('kulala').toggle_view()<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "<leader>ki", ":lua require('kulala').inspect()<CR>", { noremap = true, silent = true })

vim.api.nvim_command("set commentstring=#%s")
