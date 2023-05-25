local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "saadparwaiz1/cmp_luasnip",
  },
}

M.config = function()
  local cmp = require "cmp"
  local luasnip = require "luasnip"

  cmp.setup {
    snippet = {
      -- must use a snippet engine
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    window = {
      -- completion = { border = 'single' },
      -- documentation = { border = 'single' },
    },

    completion = {
      keyword_length = 1,
    },

    sources = {
      { name = "nvim_lsp_signature_help" },
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      { name = "buffer" },
    },

    -- we use 'comleteopt=...,noselect' but we still want cmp to autoselect
    -- an item if recommended by the LSP server (try with gopls, rust_analyzer)
    -- uncomment to disable
    -- preselect = cmp.PreselectMode.None,

    mapping = {
      ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<C-space>"] = cmp.mapping {
        i = function()
          if cmp.visible() then
            cmp.abort()
          else
            cmp.complete()
          end
        end,
        c = function()
          if cmp.visible() then
            cmp.close()
          else
            cmp.complete()
          end
        end,
      },
      ["<C-y>"] = cmp.mapping.confirm { select = true, behavior = cmp.ConfirmBehavior.Replace },
      -- ['<CR>'] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Insert })
      -- close the cmp interface if no item is selected, I find it more
      -- intuitive when using LSP autoselect (instead of sending <CR>)
      ["<CR>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          if cmp.get_selected_entry() then
            cmp.confirm { select = false, cmp.ConfirmBehavior.Insert }
          else
            cmp.close()
          end
        else
          fallback()
        end
      end),
    },
  }

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

return M
