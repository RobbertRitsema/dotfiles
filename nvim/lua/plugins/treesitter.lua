local M = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  }
}

M.init = function()
  require("nvim-treesitter.install").update { with_sync = true, prefer_git = true }
end

M.config = function()
  require("nvim-treesitter.configs").setup {
    -- A list of parser names, or "all"
    ensure_installed = {
      "css",
      "html",
      "javascript",
      "json",
      "lua",
      "python",
      "rust",
      "typescript",
      "vim",
      "yaml",
      "php",
      "vue",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    auto_install = false,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,
    },

    indent = {
      enable = true,
    },
  }
end

return M
