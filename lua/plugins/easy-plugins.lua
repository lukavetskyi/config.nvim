return {
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {}
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        config = function()
          require("notify").setup {
            render = "minimal",
            timeout = 250,
          }
          vim.notify = require('notify')
        end
      }
    }
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = "0.1.5",
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    cmd = "Telescope",
    lazy = true
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { "kevinhwang91/promise-async" },
    opts = {}
  },
  {
    'sindrets/diffview.nvim',
    opts={}
  }

}
