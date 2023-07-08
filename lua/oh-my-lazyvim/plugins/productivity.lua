return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      ---@usage set to false to disable project.nvim.
      --- This is on by default since it's currently the expected behavior.
      active = true,

      on_config_done = nil,

      ---@usage set to true to disable setting the current-woriking directory
      --- Manual mode doesn't automatically change your root directory, so you have
      --- the option to manually do so using `:ProjectRoot` command.
      manual_mode = false,

      ---@usage Methods of detecting the root directory
      --- Allowed values: **"lsp"** uses the native neovim lsp
      --- **"pattern"** uses vim-rooter like glob pattern matching. Here
      --- order matters: if one is not detected, the other is used as fallback. You
      --- can also delete or rearangne the detection methods.
      -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
      detection_methods = { "pattern" },

      -- All the patterns used to detect root dir, when **"pattern"** is in
      -- detection_methods
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },

      -- Table of lsp clients to ignore by name
      -- eg: { "efm", ... }
      ignore_lsp = {},

      -- Don't calculate root dir on specific directories
      -- Ex: { "~/.cargo/*", ... }
      exclude_dirs = {},

      -- Show hidden files in telescope
      show_hidden = false,

      -- When set to false, you will get a message when project.nvim changes your
      -- directory.
      silent_chdir = true,

      -- What scope to change the directory, valid options are
      -- * global (default)
      -- * tab
      -- * win
      scope_chdir = "global",
    },
  },
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
