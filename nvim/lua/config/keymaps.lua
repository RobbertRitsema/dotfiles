-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.del("n", "<leader>w")
vim.keymap.set({ "i", "x", "n", "s" }, "<leader>w", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Don't put deleted text in default register
vim.keymap.set({ "v", "n" }, "x", '"_X')
vim.keymap.set({ "v", "n" }, "X", '"_X')
vim.keymap.set({ "v", "n" }, "c", '"_c')
vim.keymap.set({ "v", "n" }, "C", '"_C')

-- Also, don't overwrite when pasting
vim.keymap.set({ "x" }, "p", '"_dP')
vim.keymap.set({ "x" }, "P", '"_dP')

-- alt defaults
vim.keymap.set({ "n" }, "0", "^")
vim.keymap.set({ "n" }, "Y", "y$")
vim.keymap.set({ "n" }, "n", "nzzzv")
vim.keymap.set({ "n" }, "N", "Nzzzv")
