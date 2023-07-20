return {
  "folke/zen-mode.nvim", -- <localleader>z
  opts = {
    plugins = {
      options = {
        enabled = true,
        ruler = false, -- disables the ruler text in the cmd line area
        showcmd = true, -- disables the command in the last line of the screen (if false)
      },
      wezterm = {
        enabled = true,
        font = "+1", -- (10% increase per step) can be either an absolute font size or the number of incremental step
      },
    },
  },
}
