require("catppuccin").setup({
  default_integrations = false,
  integrations = {
    blink_cmp = true,
    aerial = true,
    barbar = true,
    diffview = true,
    gitsigns = true,
  },
})

vim.cmd.colorscheme("catppuccin")
