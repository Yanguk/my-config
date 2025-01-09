require("toggleterm").setup()

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }

  vim.keymap.set("t", "<C-x>", [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- toggleable
vim.keymap.set(
  { "n", "t" },
  "<A-v>",
  "<cmd>ToggleTerm direction=vertical size=45<CR>",
  { desc = "terminal toggleable vertical term" }
)

vim.keymap.set(
  { "n", "t" },
  "<A-h>",
  "<cmd>ToggleTerm direction=horizontal<CR>",
  { desc = "terminal toggleable horizontal term" }
)

vim.keymap.set({ "n", "t" }, "<A-i>", "<cmd>ToggleTerm direction=float<CR>", { desc = "terminal toggle floating term" })
