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
  {
    -- multi cursor, <C-n> n to add selection q to skip selection
    "mg979/vim-visual-multi",
  },
  {
    "ggandor/flit.nvim",
    enabled = false,
  },
  {
    "ggandor/leap.nvim",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {},
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
  },
}
