-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>w", "<cmd>w<cr><esc>")

-- Move Lines
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move Down" })

-- Don't put deleted text in default register
map("n", "x", '"_x')
map("v", "x", '"_x')
map("n", "X", '"_X')
map("v", "X", '"_X')
map("n", "c", '"_c')
map("n", "c", '"_c')
map("v", "C", '"_C')
map("v", "C", '"_C')

-- Also, don't overwrite when pasting
map("x", "p", '"_dP')
map("x", "P", '"_dP')

-- alt defaults
map("n", "0", "^")
map("n", "Y", "y$")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
