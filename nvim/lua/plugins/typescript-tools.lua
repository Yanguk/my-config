return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    local lspconfig = require("lspconfig")
    local default_config = require("configs.default-lsp")

    require("typescript-tools").setup({
      on_init = default_config.on_init,
      on_attach = default_config.on_attach,
      capabilities = default_config.capabilities,
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          importModuleSpecifierPreference = "non-relative",
        },
      },
      root_dir = lspconfig.util.root_pattern("package.json"),
      single_file_support = false,
    })
  end,
  ft = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
}
