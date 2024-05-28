return {
  'akinsho/bufferline.nvim',
  dependencies = { { 'nvim-tree/nvim-web-devicons' }, {
    'ojroques/nvim-bufdel',
    opts = {},
    event = 'BufEnter'
  } },
  opts = {},
  event = 'BufEnter',
  lazy = true
}
