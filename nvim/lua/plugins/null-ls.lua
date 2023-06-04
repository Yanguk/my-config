local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.code_actions.eslint,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.diagnostics.cspell.with({
			extra_args = { '--config', '~/.config/cspell.json'},
		}),
		null_ls.builtins.code_actions.cspell.with({
			extra_args = { '--config', '~/.config/cspell.json'},
		}),
	},
})
