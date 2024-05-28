return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'onsails/lspkind.nvim',
    require('plugins.luasnip')
  },
  lazy = true,
  event = { "InsertEnter", "CmdlineEnter" },
  config = function()
    local cmp = require 'cmp'
    local lspkind = require('lspkind')

    cmp.setup({
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol',
        })
      },

      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = cmp.mapping.preset.insert({
        ["<cr>"] = cmp.mapping.confirm({ select = false }),
        ["<s-tab>"] = cmp.mapping.select_prev_item(),
        ["<tab>"] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),

      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' }
      }, {
        { name = 'buffer' }
      })
    })

    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' },
      }, {
        { name = 'buffer' },
      })
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end,
}
