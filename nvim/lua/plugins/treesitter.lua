local M = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  cmd = {
    "TSInstall",
    "TSUninstall",
    "TSUpdate",
    "TSUpdateSync",
    "TSInstallInfo",
    "TSInstallSync",
    "TSInstallFromGrammar",
  },
  event = "User FileOpened",
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

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
      -- config = {
      --   -- Languages that have a single comment style
      --   typescript = "// %s",
      --   css = "/* %s */",
      --   scss = "/* %s */",
      --   html = "<!-- %s -->",
      --   svelte = "<!-- %s -->",
      --   vue = "<!-- %s -->",
      --   json = "",
      -- },
    },

    indent = {
      enable = true,
      disable = { "yaml", "python" },
    },
  }
end

return M
