-- WARN: all files often have intentional ordering to require() calls

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- mostly for example, but some might be handy
require("oh-my-lazyvim.commands")

-- load your files last so they take precedence if needed
require("user.commands")
require("user.globals")
