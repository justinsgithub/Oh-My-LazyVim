local flashopts = { -- only match beginning of words
  search = {
    mode = function(str)
      return "\\<" .. str
    end,
  },
  jump = {
    autojump = true,
  },
}

return {
  "folke/flash.nvim",
  ---@type Flash.Config
  opts = {
    jump = {
      autojump = true,
    },
  },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump(flashopts)
      end,
      desc = "Flash",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote(flashopts)
      end,
      desc = "Remote Flash",
    },
  },
}
