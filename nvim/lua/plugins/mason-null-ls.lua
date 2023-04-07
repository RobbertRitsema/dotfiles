local M = {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
}

function M.config()
	require("mason-null-ls").setup({
		automatic_setup = true,
	})

	require("mason-null-ls").setup_handlers() -- If `automatic_setup` is true. })
end

return M
