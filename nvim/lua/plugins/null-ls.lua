local M = {
	"jose-elias-alvarez/null-ls.nvim",
	event = "VeryLazy",
}

local nls = require("null-ls")
local nls_utils = require("null-ls.utils")
local b = nls.builtins

local with_diagnostics_code = function(builtin)
	return builtin.with({
		diagnostics_format = "#{m} [#{c}]",
	})
end

local with_root_file = function(builtin, file)
	return builtin.with({
		condition = function(utils)
			return utils.root_has_file(file)
		end,
	})
end

local sources = {
	-- formatting
	--
	with_root_file(b.formatting.prettierd, ".prettierrc.json"),
	with_root_file(b.formatting.eslint_d, ".eslintrc"),
	b.formatting.black.with({ extra_args = { "--fast" } }),
	b.formatting.isort,

	with_root_file(b.formatting.stylua, "stylua.toml"),

	-- diagnostics
	b.diagnostics.flake8,
	b.diagnostics.tsc,

	-- hover
	b.hover.dictionary,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

function M.config()
	nls.setup({
		-- debug = true,
		debounce = 150,
		save_after_format = true,
		sources = sources,
		-- you can reuse a shared lspconfig on_attach callback here
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						lsp_formatting(bufnr)
					end,
				})
			end
		end,
		root_dir = nls_utils.root_pattern(".git"),
	})
end

return M
