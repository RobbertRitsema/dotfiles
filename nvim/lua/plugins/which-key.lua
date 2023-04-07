local M = {
	"folke/which-key.nvim",
	lazy = false,
}

function M.config()
	vim.o.timeout = true
	vim.o.timeoutlen = 300
	require("which-key").setup()
end

return M
