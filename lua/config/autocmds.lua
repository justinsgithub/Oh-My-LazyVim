-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
require("oh-my-lazyvim.config.autocmds")

-- make sure your files are loaded second so they take precedence if needed
require("user.config.autocmds")
