local null_ls = require("null-ls")

local cspell_config = {
	find_json = function(cwd)
		return "~/.config/nvim/lua/plugins/cspell/cspell.json"
	end,
}

local cspell = require("cspell")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.diagnostics.cspell,
		-- null_ls.builtins.code_actions.cspell,

		cspell.diagnostics.with({ config = cspell_config }),
		cspell.code_actions.with({ config = cspell_config }),
	},
})

