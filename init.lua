-- bootstrap lazy.nvim, LazyVim and your plugins
CONFIGDIR = vim.api.nvim_eval("stdpath('config')")

require("config.lazy")
require("user.commands")
require("user.globals")
require("user.examples")
