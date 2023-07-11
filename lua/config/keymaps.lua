-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- MAP("n", "<leader>o", "<cmd>MkOpenSrc<cr>")
MAP("n", "<F9>", ":OpenLine below<cr>")
MAP("n", "<F21>", ":OpenLine above<cr>")
MAP("n", "<localleader>b", ":BiPolar<cr>")

-- ARROWS BAD
-- MAP({ "n", "i" }, "<Left>", "")
-- MAP({ "n", "i" }, "<Right>", "")
-- MAP({ "n", "i" }, "<Up>", "")
-- MAP({ "n", "i" }, "<Down>", "")

-- stylua: ignore start
MAP( "n", "<leader>pp", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", { desc = "Preview Definition" })
MAP( "n", "<leader>pt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>", { desc = "Preview Type Definition" })
MAP( "n", "<leader>pi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", { desc = "Preview Implementation" })
MAP("n", "<leader>pc", "<cmd>lua require('goto-preview').close_all_win()<cr>", { desc = "Close All Preview Win" })
MAP( "n", "<leader>pr", "<cmd>lua require('goto-preview').goto_preview_references()<cr>", { desc = "Preview References" })
-- stylua: ignore end

-- for dial.nvim better incrementing / decrementing
MAP("n", "<C-a>", require("dial.map").inc_normal())
MAP("n", "<C-x>", require("dial.map").dec_normal())
MAP("n", "g<C-a>", require("dial.map").inc_gnormal())
MAP("n", "g<C-x>", require("dial.map").dec_gnormal())
MAP("v", "<C-a>", require("dial.map").inc_visual())
MAP("v", "<C-x>", require("dial.map").dec_visual())
MAP("v", "g<C-a>", require("dial.map").inc_gvisual())
MAP("v", "g<C-x>", require("dial.map").dec_gvisual())

-- Visual Select code you want to create snippet with
MAP("v", "<leader>cn", ":CarbonNow<cr>", { desc = "Create Code Snippet" })

-- local leader
MAP("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all" })
MAP("n", "<LocalLeader>z", ":ZenMode<cr>", { desc = "Zen Mode" })
MAP("n", "<localleader>w", ":w<cr>", { desc = "Save Buffer" })
MAP("n", "<localleader>W", ":wall<cr>", { desc = "Save All Buffers" })
MAP("n", "<localleader>p", ":BufferLinePick<cr>", { desc = "Pick Buffer" })

-- may need modified for windows or Mac, not sure, in oh-my-lazyvim/commands.lua
MAP("n", "gh", "<cmd>OpenGithubRepo<cr>", { desc = "Open Github Repo" })

-- turn off, using <localleader>w to save instead instead
MAP({ "i", "v", "n", "s" }, "<C-s>", "")

--  access system clipboard
MAP({ "v", "n" }, "|", '"+', { desc = "System Clipboard" })

-- better indent
MAP("n", ">", ">>", { desc = "Single Press Indent" })
MAP("n", "<", "<<", { desc = "Single Press Unkndent" })

-- better up/down
MAP({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
MAP({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
MAP("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
MAP("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
MAP("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
MAP("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
MAP("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
MAP("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
MAP("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
MAP("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
MAP("n", "<A-j>", "")
MAP("n", "<A-k>", "")
MAP("i", "<A-j>", "")
MAP("i", "<A-k>", "")
MAP("v", "<A-j>", "")
MAP("v", "<A-k>", "")

-- buffers
MAP("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
MAP("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
MAP("n", "[b", "")
MAP("n", "]b", "")
MAP("n", "<leader>bo", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
MAP("n", "<leader>`", "")

-- Clear search with <esc>
MAP({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
-- stylua: ignore
MAP( "n", "<leader>ur", "<cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><cr>", { desc = "Redraw / clear hlsearch / diff update" })

MAP({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
MAP("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
MAP("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
MAP("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
MAP("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
MAP("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
MAP("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
MAP("i", ",", ",<c-g>u")
MAP("i", ".", ".<c-g>u")
MAP("i", ";", ";<c-g>u")

-- save file (local leader handles this)
-- MAP({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
MAP("v", "<", "<gv")
MAP("v", ">", ">gv")

if not Util.has("trouble.nvim") then
  MAP("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
  MAP("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
end

-- stylua: ignore start

-- toggle options
MAP("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
MAP("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
MAP("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
MAP("n", "<leader>ul", function() Util.toggle("relativenumber", true) Util.toggle("number") end, { desc = "Toggle Line Numbers" })
MAP("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
MAP("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })
if vim.lsp.inlay_hint then
  MAP("n", "<leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })
end

-- lazygit
MAP("n", "<leader>gg", function() Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false }) end, { desc = "Lazygit (root dir)" })
MAP("n", "<leader>gG", function() Util.float_term({ "lazygit" }, {esc_esc = false, ctrl_hjkl = false}) end, { desc = "Lazygit (cwd)" })

MAP("n", "<leader>qq", "")

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  MAP("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- windows
MAP("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
MAP("n", "<leader>wc", "<C-W>c", { desc = "Close window", remap = true })
MAP("n", "<leader>wb", "<C-W>s", { desc = "Split window below", remap = true })
MAP("n", "<leader>wr", "<C-W>v", { desc = "Split window right", remap = true })
MAP("n", "<leader>-", "")
MAP("n", "<leader>|", "")

-- tabs
MAP("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
MAP("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
MAP("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })
MAP("n", "<leader><tab>N", "<cmd>tabnext<cr>", { desc = "Next Tab" })
MAP("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
MAP("n", "<leader><tab>c", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- floating terminal
local lazyterm = function() Util.float_term(nil, { cwd = Util.get_root() }) end
MAP("n", "<leader>tl", lazyterm, { desc = "Lazy Term (root dir)" })
MAP("n", "<leader>tL", function() Util.float_term() end, { desc = "Lazy Term (cwd)" })

-- must override keys for telescope here
MAP("n", "<leader>ft", Util.telescope("live_grep"), { desc = "Text" })
MAP("n", "<leader>fT", "")

-- delete mappings you don't want like this (CAREFUL, MAY OVERWRITE A KEY IN PLUGIN TABLE THAT YOU WANT)
-- -- overriding some LazyVim defaults
MAP("n", "<leader><tab><tab>", "")
MAP("n", "<leader><tab>[", "")
MAP("n", "<leader><tab>]", "")
MAP("n", "<leader><tab>d", "")
-- lazy
MAP("n", "<leader>Pl", "<cmd>Lazy<cr>", { desc = "Lazy" })
MAP("n", "<leader>l", "")
-- new file
MAP("n", "<leader>fn", "", { desc = "New File" })
-- Trouble
MAP("n", "<leader>xl", "", { desc = "Location List" })
MAP("n", "<leader>xq", "", { desc = "Quickfix List" })
