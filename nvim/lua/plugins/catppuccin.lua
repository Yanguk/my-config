return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      aerial = true,
      blink_cmp = true,
      diffview = true,
      grug_far = true,
      indent_blankline = {
        enabled = true,
        scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
        colored_indent_levels = false,
      },
      mason = true,
      noice = true,
      octo = true,
      lsp_trouble = true,
      telescope = {
        enabled = true,
      },
      which_key = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)

    vim.cmd.colorscheme("catppuccin")
  end,
}
