return {
  "akinsho/toggleterm.nvim",
  keys = {
    {
      "<leader>lg",
      "<cmd>lua _lazygit_toggle()<CR>",
      desc = "Toggle LazyGit",
    },

    -- ToggleTerm: Vertical
    {
      "<A-v>",
      "<cmd>ToggleTerm direction=vertical size=45<CR>",
      mode = { "n", "t" },
      desc = "Toggle terminal vertical",
    },

    -- ToggleTerm: Horizontal
    {
      "<A-h>",
      "<cmd>ToggleTerm direction=horizontal<CR>",
      mode = { "n", "t" },
      desc = "Toggle terminal horizontal",
    },

    -- ToggleTerm: Floating
    {
      "<A-i>",
      "<cmd>ToggleTerm direction=float<CR>",
      mode = { "n", "t" },
      desc = "Toggle terminal floating",
    },
  },
  config = function()
    require("toggleterm").setup()

    ---@diagnostic disable-next-line: duplicate-set-field
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
          return vim.o.columns - 10
        end,
        height = function()
          return vim.o.lines - 8
        end,
      },
    })

    ---@diagnostic disable-next-line: lowercase-global
    function _lazygit_toggle()
      lazygit:toggle()
    end
  end,
}
