-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- This file is automatically loaded by plugins.core

require("oh-my-lazyvim.config.options")

-- Always make sure your files are loaded last incase you want to change options or anything else
require("user.config.options")
