local Util = require("lazyvim.util")
return {
  "nvim-telescope/telescope.nvim",
  commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
  cmd = "Telescope",
  -- add telescope-fzf-native
  -- dependencies = {
  --   "nvim-telescope/telescope-fzf-native.nvim",
  --   build = "make",
  --   config = function()
  --     require("telescope").load_extension("fzf")
  --   end,
  -- },
  version = false, -- telescope did only one release, so use HEAD for now
  -- change some options
  -- opts = {
  --   defaults = {
  --     layout_strategy = "horizontal",
  --     layout_config = { prompt_position = "top" },
  --     sorting_strategy = "ascending",
  --     winblend = 0,
  --   },
  -- },
  keys = {
    { "<Leader>,", false },
    { "<Leader>/", false },
    { "<Leader>:", false },
    { "<Leader><Space>", false },
    -- find
    { "<Leader>fc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      -- add a keymap to browse plugin files
      -- stylua: ignore
    {
      "<leader>fP",
      function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
      desc = "Find Plugin File",
    },
      -- add a keymap to browse LazyVim default config
      -- stylua: ignore
    {
      "<leader>fC",
      function() require("telescope.builtin").live_grep({ cwd = vim.fn.stdpath("data") .. "/lazy/LazyVim/lua/lazyvim" }) end,
      desc = "Find LazyVim Config",
    },
    {
      "<Leader>ft",
      Util.telescope("live_grep"),
      desc = "Text",
    },
    { "<Leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    {
      "<Leader>fB",
      "<cmd>Telescope buffers show_all_buffers=true<cr>",
      desc = "All Buffers",
    },
    {
      "<Leader>fw",
      Util.telescope("grep_string"),
      desc = "Word (root dir)",
    },
    {
      "<Leader>fW",
      Util.telescope("grep_string", { cwd = false }),
      desc = "Word (cwd)",
    },
    {
      "<Leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
    -- git
    { "<Leader>gc", "<cmd>Telescope git_commits<cr>", desc = "commits" },
    { "<Leader>gs", "<cmd>Telescope git_status<cr>", desc = "status" },
  },
}
