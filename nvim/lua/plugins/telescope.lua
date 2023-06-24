local function keymaps()
  local map = vim.keymap.set
  local builtin = require "telescope.builtin"

  map("n", "<C-p>", builtin.find_files, {})
  map("n", "<C-f>", builtin.live_grep, {})
end

local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  event = "VeryLazy",
}

M.init = function()
  local actions = require "telescope.actions"

  keymaps()

  require("telescope").setup {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close,
        },
      },
    },
  }
end

return M
