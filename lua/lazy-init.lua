-- lazy-init.lua

-- Set the path to your plugins folder
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

-- Automatically load all plugin configuration files in 'plugins' folder
require('lazy').setup({
  -- spec = vim.fn.stdpath('config') .. '/lua/plugins', -- specify the path to your plugins folder
  spec = {
        { import = "plugins" } -- 自动导入 plugins 文件夹中的所有插件配置
  },
  defaults = {
    lazy = true, -- lazy load plugins by default
  },
  install = {
    missing = true,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "netrwPlugin",
        "tarPlugin",
        "gzip",
      },
    },
  },
})

