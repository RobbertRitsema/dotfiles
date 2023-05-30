local function keymaps()
  local map = vim.keymap.set

  function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    map("t", "<esc>", [[<C-\><C-n>]], opts)
    map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    map("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
  end

  map("n", "<leader>t", [[<Cmd> ToggleTerm<CR>]])
  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
end

local M = {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
}

M.config = function()
  keymaps()

  require("toggleterm").setup()
end

return M
