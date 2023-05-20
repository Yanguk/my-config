local null_ls = require("null-ls")
local cspell = require("cspell")

local cspell_config = {
	find_json = function(cwd)
		return "~/.config/cspell/cspell.json"
	end,
}

null_ls.setup({
	sources = {
		cspell.diagnostics.with({ config = cspell_config }),
		cspell.code_actions.with({ config = cspell_config }),
	},
})
