local M = {
  "nvim-lualine/lualine.nvim",
  event = "BufReadPre",
  -- lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

M.config = function()
  require("lualine").setup {
    options = {
      icons_enabled = true,
      theme = "everforest",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = {},
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        { "filename", file_status = true, path = 1 },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "mode" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  }
end

return M
