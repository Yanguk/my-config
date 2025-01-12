local lspconfig = require("lspconfig")

local M = {}

-- https://eslint.org/docs/user-guide/configuring/configuration-files#configuration-file-formats
local root_file = {
  ".eslintrc",
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintrc.yaml",
  ".eslintrc.yml",
  ".eslintrc.json",
  "eslint.config.js",
  "eslint.config.mjs",
  "eslint.config.cjs",
  "eslint.config.ts",
  "eslint.config.mts",
  "eslint.config.cts",
}

M.root_dir = function(startpath)
  local match = lspconfig.util.search_ancestors(startpath, function(path)
    for _, pattern in ipairs(root_file) do
      for _, p in ipairs(vim.fn.glob(table.concat({ path, pattern }, "/"), true, true)) do
        if vim.loop.fs_stat(p) then
          return path
        end
      end
    end
  end)

  if match ~= nil then
    return match
  end
end

M.activeFixAll = function(bufnr)
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    command = "EslintFixAll",
  })
end

return M
