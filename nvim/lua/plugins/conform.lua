-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#format-command
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },

    javascript = {
      "prettier",
    },
    typescript = {
      "prettier",
    },
    javascriptreact = {
      "prettier",
    },
    typescriptreact = {
      "prettier",
    },
    markdown = { "prettier" },
    html = { "prettier" },

    racket = { "raco" },
    sh = { "shfmt" },
    rust = { "rustfmt" },
    c = { "clang_format" },

    toml = { "taplo" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "yamlfmt" },
    zig = { "zig fmt" },
  },
  -- format_on_save = function(bufnr)
  --   -- Disable with a global or buffer-local variable
  --   if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
  --     return
  --   end
  --   return { timeout_ms = 500, lsp_format = "fallback" }
  -- end,
})

local command = vim.api.nvim_create_user_command

command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

vim.api.nvim_set_keymap("n", "<leader>fm", ":Format<CR>", { noremap = true, silent = true })
