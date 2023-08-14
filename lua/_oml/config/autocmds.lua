local utils = require("_oml.utils")
local augroup = utils.augroup

-- for the autocorrect plugin, very handy but slow start up, only want to start on certain file types
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("autocorrect"),
  pattern = { "*.md", "*.txt", "[^.]\\+" },
  command = "call AutoCorrect()",
})

-- Disable autoformat for markdown files, (not work good with material mkdocs)
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- just for example
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("example"),
  pattern = { "*" },
  command = "echo 'lol'",
})

-- how to delete autocommands you do not want
vim.api.nvim_del_augroup_by_name("oml_example")

vim.api.nvim_create_autocmd("BufNewFile", {
  group = augroup("html"),
  pattern = { "*.html" },
  callback = function()
    local skelpath = utils.join_paths(utils.skeleton_dir, "html")
    vim.cmd("0r " .. skelpath)
  end,
})

-- stop from annoyance of calling source % after changing config file, (won't work right for plugin specs)
vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup("neovimdev"),
  pattern = { "*.lua" },
  callback = function()
    local cwd = vim.fn.getcwd()
    local is_nvim_config = vim.fn.findfile("lazy-lock.json", cwd) ~= ""
    -- only source neovim config lua files
    if is_nvim_config then
      vim.cmd("source %")
      -- else
      --   print("NOT NVIM CONFIG")
    end
  end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
  group = augroup("nextjs-ts"),
  pattern = { "*.ts" },
  callback = function()
    local cwd = vim.fn.getcwd()
    local found_file = vim.fn.findfile("next.config.js", cwd) ~= ""
    local api_dir = vim.fn.finddir("api", ".;" .. cwd) ~= ""
    if found_file and api_dir then
      local skelpath = utils.join_paths(utils.skeleton_dir, "nextjs-ts-api.ts")
      vim.cmd("0r " .. skelpath)
    end
  end,
})

-- TODO: finish, set buffer local keymaps depending on filetype
-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = augroup("keymaps"),
--   pattern = { "*.lua" },
--   callback = function()
--     vim.api.nvim_buf_set_keymap(0, "n", "<Leader>;c", "<cmd>lua print(vim.fn.getcwd())<cr>", {noremap = true})
--   end,
-- })
