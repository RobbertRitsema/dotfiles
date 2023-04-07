local M = {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	version = "nightly",
}

-- TODO: implement
local function open_nvim_tree(data)
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	-- create a new, empty buffer
	vim.cmd.enew()

	-- wipe the directory buffer
	vim.cmd.bw(data.buf)

	-- change to the directory
	vim.cmd.cd(data.file)

	-- open the tree
	require("nvim-tree.api").tree.open()
end

M.init = function()
	vim.keymap.set("n", "<C-e>", "<Esc>:NvimTreeToggle<CR>", { silent = true })
end

M.config = function()
	require("nvim-tree").setup({
		update_focused_file = {
			enable = true,
		},
		disable_netrw = true,
		hijack_cursor = true,
		hijack_netrw = false,
		update_cwd = true,
		view = {
			width = 30,
			side = "left",
			mappings = {
				custom_only = false,
				list = {
					{ key = "l", action = "edit" },
					{ key = "h", action = "close_node" },
					{ key = "<BS>", action = "dir_up" },
					{ key = "o", action = "cd" },
				},
			},
		},
		renderer = {
			indent_markers = {
				enable = true,
				icons = {
					corner = "└ ",
					edge = "│ ",
					none = "  ",
				},
			},
			icons = {
				symlink_arrow = " → ", -- ➜ → ➛
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = false,
				},
				glyphs = {
					git = {
						-- staged      = "✓",
						-- renamed     = "➜",
						-- renamed     = "→",
						unstaged = "M",
						staged = "S",
						unmerged = "U",
						renamed = "R",
						untracked = "?",
						deleted = "✗",
						ignored = "◌",
					},
				},
			},
			special_files = {
				"README.md",
				"LICENSE",
				"Cargo.toml",
				"Makefile",
				"package.json",
				"package-lock.json",
				"go.mod",
				"go.sum",
			},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		filters = {
			dotfiles = false,
			custom = {
				"\\.git",
				".cache",
				"node_modules",
				"__pycache__",
				".ropeproject",
				-- ".null-ls*",
			},
		},
		git = {
			enable = true,
			ignore = false,
			timeout = 400,
		},
		actions = {
			use_system_clipboard = false,
			change_dir = {
				enable = false,
				global = false,
				restrict_above_cwd = false,
			},
			open_file = {
				quit_on_open = false,
				resize_window = true,
			},
		},
	})

	vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
end

return M
