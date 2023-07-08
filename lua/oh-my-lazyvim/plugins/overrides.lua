local Util = require("lazyvim.util")

return {
  {
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
      { "<leader>,", false },
      { "<leader>/", false },
      { "<leader>:", false },
      { "<leader><space>", false },
      -- find
      { "<leader>fc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>ft", Util.telescope("live_grep"), desc = "Text" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fB", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "All Buffers" },
      { "<leader>fw", Util.telescope("grep_string"), desc = "Word (root dir)" },
      { "<leader>fW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
    },
  },
  {
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
          ["<leader>D"] = { name = "+Debug" },
          ["<leader>P"] = { name = "+Plugins" },
          ["<leader>S"] = { name = "+Session" },
          ["<leader>T"] = { name = "+Test" },
          ["<leader>Y"] = { name = "Yank History" },
          ["<leader>b"] = { name = "+Buffer" },
          ["<leader>c"] = { name = "+Code" },
          ["<leader>d"] = { name = "+Diagnostics" },
          ["<leader>f"] = { name = "+Find" },
          ["<leader>g"] = { name = "+Git" },
          ["<leader>gh"] = { name = "+Hunks" },
          ["<leader>p"] = { name = "+Preview" },
          ["<leader>s"] = { name = "+Search" },
          ["<leader>t"] = { name = "+Tabs" },
          ["<leader>u"] = { name = "+UI" },
          ["<leader>w"] = { name = "+Windows" },
          ["<leader>x"] = { name = "+Terminal" },
          ["<localleader>s"] = { name = "+Surround" },
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
  },
}
