return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      blink_cmp = true,
      diffview = true,
      -- aerial = true,
      -- leap = true,
      -- lsp_trouble = true,
      -- notify = true,
      -- which_key = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)

    vim.cmd.colorscheme("catppuccin")
  end,
}
