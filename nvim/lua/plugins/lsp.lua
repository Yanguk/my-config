---@diagnostic disable-next-line: deprecated
table.unpack = table.unpack or unpack

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true
})

local lspconfig = require("lspconfig")

-- require("nvchad.configs.lspconfig").defaults()
-- require("configs.lspconfig")
--
require'lspconfig'.lua_ls.setup({})

-- local server_configs = {
--   "yamlls",
--   "tailwindcss",
--   "graphql",
--
--   -- ["eslint"] = {
--   --   on_attach = function(client, bufnr)
--   --     -- default_config.on_attach(client, bufnr)
--   --
--   --     vim.api.nvim_create_autocmd("BufWritePre", {
--   --       buffer = bufnr,
--   --       command = "EslintFixAll",
--   --     })
--   --   end,
--   -- },
--   -- ["bashls"] = {
--   --   filetypes = { "sh", "zsh", "bash" },
--   -- },
--   -- ["clangd"] = {
--   --   capabilities = vim.tbl_extend("force", default_config.capabilities, {
--   --     offsetEncoding = "utf-16",
--   --   }),
--   -- },
--   -- ["denols"] = {
--   --   root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
--   -- },
-- }
--
-- for k, v in pairs(server_configs) do
--   local server, config = table.unpack(
--     type(k) == "number" and { v, k } or { k, v }
--   )
--
--   lspconfig[server].setup(config)
-- end
