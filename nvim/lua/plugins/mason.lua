local M = {
	"williamboman/mason.nvim",
  lazy = false,
	build = ":MasonUpdate",
}

function M.config()
	require("mason").setup({ ui = { border = "rounded" } })
end

return M
