require("toggleterm").setup()

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }

  vim.keymap.set("t", "<C-x>", [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  display_name = "lazygit",
  direction = "float",
  float_opts = {
    width = function()
      return vim.o.columns
    end,
    height = function()
      return vim.o.lines - 5
    end,
  },
})

---@diagnostic disable-next-line: lowercase-global
function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

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
