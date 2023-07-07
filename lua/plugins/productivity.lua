return {
  {
    "iamcco/markdown-preview.nvim",
    -- build = "cd app && npm install",
    build = ":call mkdp#util#install()", -- USE THIS INSTEAD OF ABOVE LINE FOR LAZY
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "wakatime/vim-wakatime",
  },
  {
    "panozzaj/vim-autocorrect",
  },
  {
    "folke/zen-mode.nvim", -- <localleader>z
    opts = {
      plugins = {
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = true, -- disables the command in the last line of the screen
        },
        wezterm = {
          enabled = true,
          font = "+1", -- (10% increase per step) can be either an absolute font size or the number of incremental step
        },
      },
    },
  },
}
