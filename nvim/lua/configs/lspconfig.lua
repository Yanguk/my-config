---@diagnostic disable-next-line: deprecated
table.unpack = table.unpack or unpack

local lspconfig = require("lspconfig")
local default_config = require("configs.default-lsp")

local server_configs = {
  "yamlls",
  "tailwindcss",
  "graphql",

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
    capabilities = vim.tbl_extend("force", default_config.capabilities, {
      offsetEncoding = "utf-16",
    }),
  },
  -- ["denols"] = {
  --   root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  -- },
}

for k, v in pairs(server_configs) do
  local server, config = table.unpack(
    type(k) == "number" and { v, default_config } or { k, vim.tbl_deep_extend("force", default_config, v) }
  )

  lspconfig[server].setup(config)
end

-- local function is_current_dir_moknowre_included()
--   local current_dir = vim.fn.getcwd()                    -- 현재 작업 디렉토리 가져오기
--   local dir_name = vim.fn.fnamemodify(current_dir, ":t") -- 디렉토리 이름만 가져오기
--
--   return string.find(dir_name, "moknowre") ~= nil        -- moknowre가 포함되어 있는지 확인
-- end
