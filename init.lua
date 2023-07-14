-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("oh-my-lazyvim.commands")

-- load your files last so they take precedence if needed (if you have such files)
require("user.globals")
