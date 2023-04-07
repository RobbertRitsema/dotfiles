-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Settings for filetypes:
-- Set indentation to 2 spaces
augroup("setIndent", { clear = true })

autocmd("Filetype", {
	group = "setIndent",
	pattern = { "vue", "css", "scss", "javascript", "typescript", "yaml", "lua", "json" },
	command = "setlocal shiftwidth=2 tabstop=2",
})

-- Save cursor position when quitting file
-- autocmd('saveCursorPosition', {
--   group = 'BufReadPost',
--   pattern = { '*' },
--  command = 'call setpos(".", getpos("\'""))'
-- })
