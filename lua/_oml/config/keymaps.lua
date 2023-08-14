local Util = require("lazyvim.util")
local map = require("_oml.utils").keymap

vim.keymap.set("n", "<leader>A", ":Alpha<cr>", { desc = "Alpha" })

-- stylua: ignore start
map( "n", "<leader>pp", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", { desc = "Preview Definition" })
map( "n", "<leader>pt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>", { desc = "Preview Type Definition" })
map( "n", "<leader>pi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", { desc = "Preview Implementation" })
map("n", "<leader>pc", "<cmd>lua require('goto-preview').close_all_win()<cr>", { desc = "Close All Preview Win" })
map( "n", "<leader>pr", "<cmd>lua require('goto-preview').goto_preview_references()<cr>", { desc = "Preview References" })
-- stylua: ignore end

-- Visual Select code you want to create snippet with
map("v", "<leader>cn", ":CarbonNow<cr>", { desc = "Create Code Snippet" })

-- local leader
map("n", "<localleader>Q", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<localleader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<LocalLeader>z", ":ZenMode<cr>", { desc = "Zen Mode" })
map("n", "<localleader>w", ":w<cr>", { desc = "Save Buffer" })
map("n", "<localleader>W", ":wall<cr>", { desc = "Save All Buffers" })
map("n", "<localleader>p", ":BufferLinePick<cr>", { desc = "Pick Buffer" })

-- change word to its opposite
map("n", "<localleader>b", ":BiPolar<cr>")

-- open line without moving cursor or entering insert mode
map("n", "<localleader>o", ":OpenLine below<cr>")
map("n", "<localleader>O", ":OpenLine above<cr>")

-- may need modified for windows or Mac, not sure, in oh-my-lazyvim/commands.lua
map("n", "gh", "<cmd>OpenGithubRepo<cr>", { desc = "Open Github Repo" })

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

-- Move Lines (Alt is only for my terminal key bindings)
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
-- stylua: ignore
map( "n", "<leader>ur", "<cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><cr>", { desc = "Redraw / clear hlsearch / diff update" })

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

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

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

map("n", "<leader>qq", "")

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wc", "<C-W>c", { desc = "Close window", remap = true })
map("n", "<leader>wh", "<C-W>s", { desc = "Split window horizontal", remap = true })
map("n", "<leader>wv", "<C-W>v", { desc = "Split window vertical", remap = true })
map("n", "<leader>w-", "")
map("n", "<leader>w|", "")
map("n", "<leader>-", "")
map("n", "<leader>|", "")

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>N", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>c", "<cmd>tabclose<cr>", { desc = "Close Tab" })

map("n", "gl", vim.diagnostic.open_float, { desc = "View Diagnostic"})
-- floating terminal
local lazyterm = function() Util.float_term(nil, { cwd = Util.get_root() }) end
map("n", "<leader>tl", lazyterm, { desc = "Lazy Term (root dir)" })
map("n", "<leader>tL", function() Util.float_term() end, { desc = "Lazy Term (cwd)" })

-- must override keys for telescope here
map("n", "<leader>ft", Util.telescope("live_grep"), { desc = "Text" })
map("n", "<leader>fT", "")

-- -- overriding some LazyVim defaults
map("n", "<leader><tab><tab>", "")
map("n", "<leader><tab>[", "")
map("n", "<leader><tab>]", "")
map("n", "<leader><tab>d", "")

-- LazyVim Changelog
map("n", "<leader>Lc", Util.changelog, { desc = "LazyVim Changelog" })
-- Lazy
map("n", "<leader>Ll", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>l", "")

-- remove new file binding, f is for find
map("n", "<leader>fn", "", { desc = "New File" })

-- Trouble, remove bindings, diagnostics are under d
map("n", "<leader>xl", "", { desc = "Location List" })
map("n", "<leader>xq", "", { desc = "Quickfix List" })
