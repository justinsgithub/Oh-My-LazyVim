local opts = {
  filesystem = {
    commands = {
      -- Override delete to use trash instead of rm
      -- delete = function(state)
      --   local path = state.tree:get_node().path
      --   vim.fn.system({ "gio", "trash", vim.fn.fnameescape(path) })
      --   require("neo-tree.sources.manager").refresh(state.name)
      -- end,
    },
  },
}

local keys = {
  {
    "<leader>e",
    function()
      require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
    end,
    desc = "Explorer",
  },
  {
    "<leader>E",
    false, -- function() require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() }) end, desc = "Explorer (cwd)", },
    { "<leader>fe", false },
    { "<leader>fE", false },
  },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  opts = opts,
  keys = keys,
}
