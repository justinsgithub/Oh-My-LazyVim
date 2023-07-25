return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function()
    return {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      defaults = {
        mode = { "n", "v" },
        ["<Leader>D"] = { name = "+Debug" },
        ["<Leader>L"] = { name = "+Lazy" },
        ["<Leader>S"] = { name = "+Session" },
        ["<Leader>T"] = { name = "+Test" },
        ["<Leader>Y"] = { name = "Yank History" },
        ["<Leader>b"] = { name = "+Buffer" },
        ["<Leader>c"] = { name = "+Code" },
        ["<Leader>d"] = { name = "+Diagnostics" },
        ["<Leader>f"] = { name = "+Find" },
        ["<Leader>g"] = { name = "+Git" },
        ["<Leader>gh"] = { name = "+Hunks" },
        ["<Leader>p"] = { name = "+Preview" },
        ["<Leader>s"] = { name = "+Search" },
        ["<Leader>t"] = { name = "+Term" },
        ["<Leader><tab>"] = { name = "+Tabs" },
        ["<Leader>u"] = { name = "+UI" },
        ["<Leader>w"] = { name = "+Windows" },
        ["<LocalLeader>s"] = { name = "+Surround" },
        ["["] = { name = "+prev" },
        ["]"] = { name = "+next" },
        ["g"] = { name = "+goto" },
      },
    }
  end,
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
