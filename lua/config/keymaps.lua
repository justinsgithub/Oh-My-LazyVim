-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

map(
  "n",
  "<localleader>pp",
  "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
  { desc = "Preview Definition" }
)
map(
  "n",
  "<localleader>pt",
  "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
  { desc = "Preview Type Definition" }
)
map(
  "n",
  "<localleader>pi",
  "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
  { desc = "Preview Implementation" }
)
map("n", "<localleader>pc", "<cmd>lua require('goto-preview').close_all_win()<CR>", { desc = "Close All Preview Win" })
map(
  "n",
  "<localleader>pr",
  "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
  { desc = "Preview References" }
)

-- code outline window
map("n", "<leader>ca", "<cmd>AerialToggle!<CR>", { desc = "Open Code Outline Window" })
-- for dial.nvim better incrementing / decrementing
map("n", "<C-a>", require("dial.map").inc_normal())
map("n", "<C-x>", require("dial.map").dec_normal())
map("n", "g<C-a>", require("dial.map").inc_gnormal())
map("n", "g<C-x>", require("dial.map").dec_gnormal())
map("v", "<C-a>", require("dial.map").inc_visual())
map("v", "<C-x>", require("dial.map").dec_visual())
map("v", "g<C-a>", require("dial.map").inc_gvisual())
map("v", "g<C-x>", require("dial.map").dec_gvisual())

-- Visual Select code you want to create snippet with
map("v", "<leader>cn", ":CarbonNow<CR>", { desc = "Create Code Snippet" })

-- local leader
map("n", "<localleader>q", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<LocalLeader>z", ":ZenMode<CR>", { desc = "Zen Mode" })
map("n", "<localleader>w", ":w<CR>", { desc = "Save Buffer" })
map("n", "<localleader>W", ":wall<CR>", { desc = "Save All Buffers" })
map("n", "<localleader>p", ":BufferLinePick<CR>", { desc = "Pick Buffer" })

-- user commands (may be too custom to myself, could use as templates for your own)
-- map("n", "<leader>co", "<cmd>MkOpenSrc<CR>")
-- map("n", "<localleader>o", ":OpenLine below<CR>")
-- map("n", "<localleader>O", ":OpenLine above<CR>")
-- map("n", "<localleader>b", ":BiPolar<CR>")
-- may need modified for windows or Mac, not sure, in user/commands.lua
map("n", "gh", "<cmd>OpenGithubRepo<CR>", { desc = "Open Github Repo" })

-- turn off, using <localleader>w to save instead instead
map({ "i", "v", "n", "s" }, "<C-s>", "")

--  access system clipboard
map({ "v", "n" }, "|", '"+', { desc = "System Clipboard" })

-- better indent
map("n", ">", ">>", { desc = "Single Press Indent" })
map("n", "<", "<<", { desc = "Single Press Unkndent" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "")
map("n", "<A-k>", "")
map("i", "<A-j>", "")
map("i", "<A-k>", "")
map("v", "<A-j>", "")
map("v", "<A-k>", "")

-- buffers
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "[b", "")
map("n", "]b", "")
map("n", "<leader>bo", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / clear hlsearch / diff update" }
)

map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>Pl", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>l", "")

-- new file
map("n", "<leader>fn", "", { desc = "New File" })

-- Trouble
map("n", "<leader>xl", "", { desc = "Location List" })
map("n", "<leader>xq", "", { desc = "Quickfix List" })

if not Util.has("trouble.nvim") then
  map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
  map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
end

-- stylua: ignore start

-- toggle options
map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
map("n", "<leader>ul", function() Util.toggle("relativenumber", true) Util.toggle("number") end, { desc = "Toggle Line Numbers" })
map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })
if vim.lsp.inlay_hint then
  map("n", "<leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })
end

-- lazygit
map("n", "<leader>gg", function() Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false }) end, { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function() Util.float_term({ "lazygit" }, {esc_esc = false, ctrl_hjkl = false}) end, { desc = "Lazygit (cwd)" })

-- quit (<localleader>q is the same)
map("n", "<leader>Sq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wc", "<C-W>c", { desc = "Close window", remap = true })
map("n", "<leader>wb", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>wr", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "")
map("n", "<leader>|", "")

-- tabs
map("n", "<leader>tl", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader>tf", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>tN", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- floating terminal
local lazyterm = function() Util.float_term(nil, { cwd = Util.get_root() }) end
map("n", "<leader>xl", lazyterm, { desc = "Lazy Term" })

-- do not want / changed these mappings
-- map("n", "<leader>fT", function() Util.float_term() end, { desc = "Terminal (cwd)" })
-- map("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<leader>fT", function() Util.float_term() end, { desc = "Terminal (cwd)" })
-- map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
map("n", "<leader>fT", "", { desc = "Terminal (cwd)" })
map("n", "<leader>ft", "", { desc = "Terminal (root dir)" })
map("n", "<c-/>", "", { desc = "Terminal (root dir)" })
map("n", "<c-_>", "", { desc = "which_key_ignore" })

-- delete mappings you don't want like this
map("n", "<leader><tab>l", "")
map("n", "<leader><tab>f", "")
map("n", "<leader><tab>N", "")
map("n", "<leader><tab>n", "")
map("n", "<leader><tab>p", "")
map("n", "<leader><tab>c", "")
map("n", "<leader><tab><tab>", "")
map("n", "<leader><tab>[", "")
map("n", "<leader><tab>]", "")
map("n", "<leader><tab>d", "")
