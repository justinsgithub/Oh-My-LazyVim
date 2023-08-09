local opts = {
  chunk = {
    enable = true,
    use_treesitter = true,
    notify = true, -- notify if some situation(like disable chunk mod double time)
    exclude_filetypes = {
      aerial = true,
      dashboard = true,
    },
    support_filetypes = {
      "*.lua",
      "*.js",
    },
    chars = {
      horizontal_line = "─",
      vertical_line = "│",
      left_top = "╭",
      left_bottom = "╰",
      right_arrow = ">",
    },
    style = {
      { fg = "#806d9c" },
    },
  },

  indent = {
    enable = false,
    use_treesitter = false,
    chars = {
      "│",
    },
    style = {
      { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") },
    },
  },

  line_num = {
    enable = false,
    use_treesitter = false,
    style = "#806d9c",
  },

  blank = {
    enable = false,
    chars = {
      "․",
    },
    style = {
      vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
    },
  },
}
-- would require disabling / changing indent-blankline and mini.indentscope
return {
  "shellRaining/hlchunk.nvim",
  enabled = false,
  event = { "UIEnter" },
  config = function()
    require("hlchunk").setup(opts)
  end,
}
