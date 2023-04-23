local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig['tsserver'].setup {
  capabilities = capabilities
}

lspconfig['rust_analyzer'].setup {
  capabilities = capabilities,
}

lspconfig['eslint'].setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end
})
