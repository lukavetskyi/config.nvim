local plugins = {
  require("plugins.lsp"),
  require("plugins.neo-tree"),
  require("plugins.better-escape"),
  require("plugins.lua-line"),
  require("plugins.catppuccin"),
  require("plugins.ccc"),
  require("plugins.dressing"),
  require("plugins.dashboard"),
  require("plugins.cmp"),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require("plugins.bufferline"),
  require("plugins.comment"),
  require("plugins.multicursors"),
  require("plugins.trouble"),
  require("plugins.illuminate"),
  require("plugins.gitsigns"),
  require("plugins.terminal"),
  require("plugins.debagger")
}

local opts = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)
