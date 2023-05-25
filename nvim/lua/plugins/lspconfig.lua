return {
  { "j-hui/fidget.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("fidget").setup()

      require("mason-lspconfig").setup_handlers {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {}
        end,
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  -- disables the global vim warning in all lua files
                  globals = { "vim" },
                },
              },
            },
          }
        end,
        ["pylsp"] = function()
          require("lspconfig").pylsp.setup {
            settings = {
              pylsp = {
                plugins = {
                  rope_autoimport = {
                    enabled = true,
                  },
                  pycodestyle = {
                    ignore = { "W391" },
                    maxLineLength = 100,
                  },
                },
              },
            },
          }
        end,
      }

      -- lazy load null-ls
      require "lsp"
    end,
  },
}
