local augroup = require("_oml.utils").augroup

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
