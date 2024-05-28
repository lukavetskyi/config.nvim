return {
  "RRethy/vim-illuminate",
  config = function()
    require('illuminate').configure({
      modes_allowlist = { 'n' }
    })
  end
}
