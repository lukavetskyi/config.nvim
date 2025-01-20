return {
  "RRethy/vim-illuminate",
  config = function()
    require('illuminate').configure({
      modes_allowlist = { 'n', 'i', 'v' },
      delay = 0
    })
  end
}
