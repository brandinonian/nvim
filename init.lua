-- ~/.config/nvim/init.lua
-- Bootstrap lazy.nvim
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

-- Set leader key before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set up basic options
require("config.options")

-- Initialize lazy.nvim
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
  checker = {
    enabled = true,
    notify = false,
  },
  install = {
    colorscheme = { "tokyonight" },
  },
  ui = {
    border = "rounded",
  },
})

-- Load keymaps
require("config.keymaps")

-- Set up autocommands
require("config.autocmds")

-- LSP
vim.lsp.enable({"gopls"})

vim.diagnostic.config({
  virtual_lines = true,
  underline = true,
})
