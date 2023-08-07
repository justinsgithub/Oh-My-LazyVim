-- Keymaps are automatically loaded on the VeryLazy event
-- This file is automatically loaded by lazyvim.config.init
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Oh My LazyVim keymap additions / changes
-- You can comment out this line to stick with all original LazyVim keymaps
require("_oml.config.keymaps")

-- helper function, see file for explanation
local map = require("_oml.utils").keymap

-- Change / add any additional keymaps here
-- good mappings for beginners having a hard time using hjkl instead of arrows
-- map({ "n" }, "<Left>", "")
-- map({ "n" }, "<Right>", "")
-- map({ "n" }, "<Up>", "")
-- map({ "n" }, "<Down>", "")
