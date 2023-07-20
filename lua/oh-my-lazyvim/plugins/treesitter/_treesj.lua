return {
  "Wansmer/treesj", -- unjoin lines, (can also join)
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    -- { "<localleader>t", "<cmd>TSJToggle<cr>", desc = "Toggle Lines" },
    -- { "<localleader>J", "<cmd>TSJJoin<cr>", desc = "Join Lines" },
    {
      "<localleader>j",
      "<cmd>TSJSplit<cr>",
      desc = "Toggle TreeSJ",
    },
  },
  config = function()
    require("treesj").setup({
      -- Use default keymaps
      -- (<space>m - toggle, <space>j - join, <space>s - split)
      use_default_keymaps = false, -- custom keys are set above
      -- Node with syntax error will not be formatted
      check_syntax_error = true,
      -- If line after join will be longer than max value,
      -- node will not be formatted
      max_join_length = 120,
      -- hold|start|end:
      -- hold - cursor follows the node/place on which it was called
      -- start - cursor jumps to the first symbol of the node being formatted
      -- end - cursor jumps to the last symbol of the node being formatted
      cursor_behavior = "hold",
      -- Notify about possible problems or not
      notify = true,
      -- Use `dot` for repeat action
      dot_repeat = true,
    })
  end,
}
