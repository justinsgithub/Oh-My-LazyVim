-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")
local utils = require("oh-my-lazyvim.utils")

utils.keymap("n", "<F9>", ":OpenLine below<cr>")
utils.keymap("n", "<F21>", ":OpenLine above<cr>")
utils.keymap("n", "<localleader>b", ":BiPolar<cr>")

-- ARROWS BAD
-- MAP({ "n", "i" }, "<Left>", "")
-- MAP({ "n", "i" }, "<Right>", "")
-- MAP({ "n", "i" }, "<Up>", "")
-- MAP({ "n", "i" }, "<Down>", "")

-- stylua: ignore start
utils.keymap( "n", "<leader>pp", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", { desc = "Preview Definition" })
utils.keymap( "n", "<leader>pt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>", { desc = "Preview Type Definition" })
utils.keymap( "n", "<leader>pi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", { desc = "Preview Implementation" })
utils.keymap("n", "<leader>pc", "<cmd>lua require('goto-preview').close_all_win()<cr>", { desc = "Close All Preview Win" })
utils.keymap( "n", "<leader>pr", "<cmd>lua require('goto-preview').goto_preview_references()<cr>", { desc = "Preview References" })
-- stylua: ignore end

-- for dial.nvim better incrementing / decrementing
-- utils.keymap("n", "<C-a>", require("dial.map").inc_normal())
-- utils.keymap("n", "<C-x>", require("dial.map").dec_normal())
-- utils.keymap("n", "g<C-a>", require("dial.map").inc_gnormal())
-- utils.keymap("n", "g<C-x>", require("dial.map").dec_gnormal())
-- utils.keymap("v", "<C-a>", require("dial.map").inc_visual())
-- utils.keymap("v", "<C-x>", require("dial.map").dec_visual())
-- utils.keymap("v", "g<C-a>", require("dial.map").inc_gvisual())
-- utils.keymap("v", "g<C-x>", require("dial.map").dec_gvisual())

-- Visual Select code you want to create snippet with
utils.keymap("v", "<leader>cn", ":CarbonNow<cr>", { desc = "Create Code Snippet" })

-- local leader
utils.keymap("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all" })
utils.keymap("n", "<LocalLeader>z", ":ZenMode<cr>", { desc = "Zen Mode" })
utils.keymap("n", "<localleader>w", ":w<cr>", { desc = "Save Buffer" })
utils.keymap("n", "<localleader>W", ":wall<cr>", { desc = "Save All Buffers" })
utils.keymap("n", "<localleader>p", ":BufferLinePick<cr>", { desc = "Pick Buffer" })

-- may need modified for windows or Mac, not sure, in oh-my-lazyvim/commands.lua
utils.keymap("n", "gh", "<cmd>OpenGithubRepo<cr>", { desc = "Open Github Repo" })

-- turn off, using <localleader>w to save instead instead
utils.keymap({ "i", "v", "n", "s" }, "<C-s>", "")

--  access system clipboard
utils.keymap({ "v", "n" }, "|", '"+', { desc = "System Clipboard" })

-- better indent
utils.keymap("n", ">", ">>", { desc = "Single Press Indent" })
utils.keymap("n", "<", "<<", { desc = "Single Press Unkndent" })

-- better up/down
utils.keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
utils.keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
utils.keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
utils.keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
utils.keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
utils.keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
utils.keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
utils.keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
utils.keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
utils.keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
utils.keymap("n", "<A-j>", "")
utils.keymap("n", "<A-k>", "")
utils.keymap("i", "<A-j>", "")
utils.keymap("i", "<A-k>", "")
utils.keymap("v", "<A-j>", "")
utils.keymap("v", "<A-k>", "")

-- buffers
utils.keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
utils.keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
utils.keymap("n", "[b", "")
utils.keymap("n", "]b", "")
utils.keymap("n", "<leader>bo", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
utils.keymap("n", "<leader>`", "")

-- Clear search with <esc>
utils.keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
-- stylua: ignore
utils.keymap( "n", "<leader>ur", "<cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><cr>", { desc = "Redraw / clear hlsearch / diff update" })

utils.keymap({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
utils.keymap("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
utils.keymap("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
utils.keymap("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
utils.keymap("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
utils.keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
utils.keymap("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
utils.keymap("i", ",", ",<c-g>u")
utils.keymap("i", ".", ".<c-g>u")
utils.keymap("i", ";", ";<c-g>u")

-- save file (local leader handles this)
-- MAP({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
utils.keymap("v", "<", "<gv")
utils.keymap("v", ">", ">gv")

if not Util.has("trouble.nvim") then
  utils.keymap("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
  utils.keymap("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
end

-- stylua: ignore start

-- toggle options
utils.keymap("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
utils.keymap("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
utils.keymap("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
utils.keymap("n", "<leader>ul", function() Util.toggle("relativenumber", true) Util.toggle("number") end, { desc = "Toggle Line Numbers" })
utils.keymap("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
utils.keymap("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })
if vim.lsp.inlay_hint then
  utils.keymap("n", "<leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })
end

-- lazygit
utils.keymap("n", "<leader>gg", function() Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false }) end, { desc = "Lazygit (root dir)" })
utils.keymap("n", "<leader>gG", function() Util.float_term({ "lazygit" }, {esc_esc = false, ctrl_hjkl = false}) end, { desc = "Lazygit (cwd)" })

utils.keymap("n", "<leader>qq", "")

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  utils.keymap("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- windows
utils.keymap("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
utils.keymap("n", "<leader>wc", "<C-W>c", { desc = "Close window", remap = true })
utils.keymap("n", "<leader>wh", "<C-W>s", { desc = "Split window horizontal", remap = true })
utils.keymap("n", "<leader>wv", "<C-W>v", { desc = "Split window vertical", remap = true })
utils.keymap("n", "<leader>w-", "")
utils.keymap("n", "<leader>w|", "")
utils.keymap("n", "<leader>-", "")
utils.keymap("n", "<leader>|", "")

-- tabs
utils.keymap("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
utils.keymap("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
utils.keymap("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })
utils.keymap("n", "<leader><tab>N", "<cmd>tabnext<cr>", { desc = "Next Tab" })
utils.keymap("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
utils.keymap("n", "<leader><tab>c", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- floating terminal
local lazyterm = function() Util.float_term(nil, { cwd = Util.get_root() }) end
utils.keymap("n", "<leader>tl", lazyterm, { desc = "Lazy Term (root dir)" })
utils.keymap("n", "<leader>tL", function() Util.float_term() end, { desc = "Lazy Term (cwd)" })

-- must override keys for telescope here
utils.keymap("n", "<leader>ft", Util.telescope("live_grep"), { desc = "Text" })
utils.keymap("n", "<leader>fT", "")

-- delete mappings you don't want like this (CAREFUL, MAY OVERWRITE A KEY IN PLUGIN TABLE THAT YOU WANT)
-- -- overriding some LazyVim defaults
utils.keymap("n", "<leader><tab><tab>", "")
utils.keymap("n", "<leader><tab>[", "")
utils.keymap("n", "<leader><tab>]", "")
utils.keymap("n", "<leader><tab>d", "")
-- lazy
utils.keymap("n", "<leader>Pl", "<cmd>Lazy<cr>", { desc = "Lazy" })
utils.keymap("n", "<leader>l", "")
-- new file
utils.keymap("n", "<leader>fn", "", { desc = "New File" })
-- Trouble
utils.keymap("n", "<leader>xl", "", { desc = "Location List" })
utils.keymap("n", "<leader>xq", "", { desc = "Quickfix List" })
