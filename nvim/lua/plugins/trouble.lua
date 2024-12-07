require("trouble").setup({})

vim.api.nvim_set_keymap("n", "<leader>lx", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<CR>",
  { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>lX", "<cmd>Trouble diagnostics toggle focus=true<CR>",
  { noremap = true, silent = true })
