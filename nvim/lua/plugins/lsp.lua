---@diagnostic disable-next-line: deprecated
table.unpack = table.unpack or unpack

-- mason
require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = { "ts_ls" },
})

local lspconfig = require("lspconfig")
local default_config = require("configs.default-lsp")
local eslint_config = require("configs.eslint-lsp")
local byDomain = require("configs.by-domain")

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

      -- 브릿지 프로젝트만 eslint로 포멧
      if byDomain.isBridgeProject(bufnr) then
        eslint_config.activeFixAll(bufnr)
      end
    end,
    root_dir = eslint_config.root_dir,
  },
  ["bashls"] = {
    filetypes = { "sh", "zsh", "bash" },
  },
  -- ["clangd"] = {
  --   capabilities = {
  --     offsetEncoding = "utf-16",
  --   },
  -- },
  ["denols"] = {
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  },
  "docker_compose_language_service",
  "dockerls",
}

for k, v in pairs(server_configs) do
  local server, config = table.unpack(
    type(k) == "number" and { v, default_config } or { k, vim.tbl_deep_extend("force", default_config, v) }
  )

  lspconfig[server].setup(config)
end

vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {},
  -- LSP configuration
  server = {
    on_init = default_config.on_init,
    on_attach = default_config.on_attach,
    capabilities = default_config.capabilities,
    default_settings = {
      -- rust-analyzer language server configuration
      ["rust-analyzer"] = {
        command = "clippy",
      },
    },
  },
  -- DAP configuration
  dap = {},
}

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
