local augroup = require("oh-my-lazyvim.utils").augroup

-- for the autocorrect plugin, very handy but slow start up, only want to start on certain file types
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("autocorrect"),
  pattern = { "*.md", "*.txt", "[^.]\\+" },
  command = "call AutoCorrect()",
})

-- just for example
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("example"),
  pattern = { "*" },
  command = "echo 'lol'",
})

-- how to delete autocommands you do not want
vim.api.nvim_del_augroup_by_name("oml_example")
