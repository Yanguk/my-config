local null_ls = require("null-ls")

null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
  		null_ls.builtins.diagnostics.cspell.with({
        extra_args = { "--config", vim.fn.expand("%:p:h") .. "/cspell.json" }
      }),
  		null_ls.builtins.code_actions.cspell,
    },
})
