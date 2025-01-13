local map = vim.keymap.set

local default_config = {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  on_init = function(client)
    client.server_capabilities.semanticTokensProvider = nil
  end,
  on_attach = function(client, bufnr)
    local function opts(desc)
      return { buffer = bufnr, desc = desc }
    end

    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
    map("n", "<leader>ra", vim.lsp.buf.rename, opts("rename"))

    if client.server_capabilities.inlayHintProvider then
      map("n", "<leader>ih", function()
        local current_setting = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })

        vim.lsp.inlay_hint.enable(not current_setting, { bufnr = bufnr })
      end, opts("toggle [I]nlay [H]ints"))
    end
  end,
}

-- nvim-ufo (ts 에서 배열을 폴드할려면 lsp로 해야함)
default_config.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

return default_config
