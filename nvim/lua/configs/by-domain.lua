local M = {}

M.isBridgeProject = function(bufnr)
  local bufname = vim.api.nvim_buf_get_name(bufnr)

  if bufname:find("bridge") then
    return true
  end

  if bufname:find("tooling") then
    return true
  end

  return false
end

return M
