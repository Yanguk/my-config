---@diagnostic disable-next-line: deprecated
table.unpack = table.unpack or unpack

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  dependencies = {
    "saghen/blink.cmp",
    { "williamboman/mason.nvim", cmd = "Mason" },
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = { "ts_ls" },
    })

    local lspconfig = require("lspconfig")
    local default_config = require("configs.default-lsp")
    local eslint_config = require("configs.eslint-lsp")

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
  end,
}
