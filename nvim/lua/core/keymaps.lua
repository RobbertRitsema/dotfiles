-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local map = require("utils").map

-- Change leader to a comma
vim.g.mapleader = " "

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Clear search highlighting with <leader> and c
map("n", "<Esc>", ":nohl<CR>")

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Fast saving with <leader> and w
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")

-- Keep cursor in place when joining lines
map("n", "J", "mzJ`z")

-- better up and down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

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

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<", "<<")
map("n", ">", ">>")

map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "goto declaration [LSP]" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "goto definition [LSP]" })
map("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "hover information [LSP]" })
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "goto implementation [LSP]" })
map("n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "signature help [LSP]" })
map("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "signature help [LSP]" })
map("n", "<leader>rn", '<cmd>lua require("lsp.rename").rename()<CR>', { desc = "rename [LSP]" })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "code actions [LSP]" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "goto reference [LSP]" })

map("n", "<leader>lt", "<cmd>lua require'lsp.diag'.toggle()<CR>", { desc = "toggle virtual text [LSP]" })

map(
  "n",
  "<leader>ll",
  '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "rounded" })<CR>',
  { desc = "show line diagnostic [LSP]" }
)
