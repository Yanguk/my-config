local banned_messages = { "No information available" }

-- See https://github.com/neovim/nvim-lspconfig/issues/1931#issuecomment-1297599534
-- An alternative solution: https://github.com/neovim/neovim/issues/20457#issuecomment-1266782345
---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, ...)
  for _, banned in ipairs(banned_messages) do
    if msg == banned then
      return
    end
  end
  return require("notify")(msg, ...)
end

return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    stages = "static",
  },
}
