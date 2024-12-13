---@diagnostic disable-next-line: deprecated
table.unpack = table.unpack or unpack

-- mason
require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = {
    "typos_lsp",
    "eslint",
    "tailwindcss"
  }
})

local lspconfig = require("lspconfig")
local default_config = require("configs.default-lsp")

-- server setup
local server_configs = {
  "lua_ls",
  "zls",
  "yamlls",
  "tailwindcss",
  "graphql",
  "prismals",
  ["typos_lsp"] = {
    init_options = {
      config = "~/.config/nvim/typos.toml",
    },
  },

  ["eslint"] = {
    on_attach = function(client, bufnr)
      default_config.on_attach(client, bufnr)

      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  },
  ["bashls"] = {
    filetypes = { "sh", "zsh", "bash" },
  },
  ["clangd"] = {
    capabilities = {
      offsetEncoding = "utf-16",
    },
  },
}

for k, v in pairs(server_configs) do
  local server, config = table.unpack(
    type(k) == "number" and { v, default_config } or { k, vim.tbl_deep_extend("force", default_config, v) }
  )

  lspconfig[server].setup(config)
end
