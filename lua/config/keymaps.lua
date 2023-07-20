-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init

require("oh-my-lazyvim.config.keymaps")

-- Always make sure your files are loaded last incase you want to override any keymaps
require("user.config.keymaps")
