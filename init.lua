-- bootstrap lazy.nvim, LazyVim and your plugins

-- globals needs to be loaded first for use in config files
require("oh-my-lazyvim.globals")
-- load yours second so they take precedence if needed
require("user.globals")
require("config.lazy")

require("oh-my-lazyvim.commands")
require("oh-my-lazyvim.examples")
-- load yours second so they take precedence if needed (if you have such files)
-- require("user.commands")
-- require("user.examples")
