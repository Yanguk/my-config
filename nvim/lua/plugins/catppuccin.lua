require("catppuccin").setup({
  default_integrations = false,
  integrations = {
    blink_cmp = true,
  }
})

vim.cmd.colorscheme "catppuccin"
