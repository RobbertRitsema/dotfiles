local M = {
	url = "https://tpope.io/vim/fugitive.git",
	cmd = { "Git", "Yit", "Gread", "Gwrite", "Gvdiffsplit", "Gdiffsplit" },
}

M.init = function()
	local map = require("utils").map

	-- :Gedit will always send us back to the working copy
	-- and thus serves as a quasi back button
	map("n", "<leader>gs", "<Esc>:Git<CR>", { silent = true, desc = "Git" })
	map("n", "<leader>gb", "<Esc>:Git blame<CR>", { silent = true, desc = "git blame" })
	map("n", "<leader>gp", "<Esc>:Git pull<CR>", { silent = true, desc = "Git pull" })
end

return M
