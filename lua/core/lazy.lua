-- Lazy configuration
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Files to load
  spec = {
    { import = "plugins" },
  },
  -- Default behaviour
  defaults = {
    lazy = false, -- Don't lazy load by default
    version = false, -- Install latest commit of plugin
  },
  -- Install
  install = {
    missing = true, -- Auto-install missing plugins
    colorscheme = { require("plugins.colorscheme").theme }, -- Theme
  },
  -- Update detection
  checker = {
    enabled = true, -- Check for updates
    notify = false, -- Don't notify about updates
  },
  -- File change detection
  change_detection = {
    notify = false, -- Don't notify when config has changed
  },
})
