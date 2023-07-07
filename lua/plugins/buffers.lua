return {
  { -- would have to disable bufferline
    "romgrk/barbar.nvim",
    enabled = false,
    keys = {
      -- Move to previous/next
      { "<A-,>", "<Cmd>BufferPrevious<CR>" },
      { "<A-.>", "<Cmd>BufferNext<CR>" },
      { "<A-<>", "<Cmd>BufferMovePrevious<CR>" }, -- Re-order to previous/next
      { "<A->>", "<Cmd>BufferMoveNext<CR>" },
      { "<A-1>", "<Cmd>BufferGoto 1<CR>" }, -- Goto buffer in position...
      { "<A-2>", "<Cmd>BufferGoto 2<CR>" },
      { "<A-3>", "<Cmd>BufferGoto 3<CR>" },
      { "<A-4>", "<Cmd>BufferGoto 4<CR>" },
      { "<A-5>", "<Cmd>BufferGoto 5<CR>" },
      { "<A-6>", "<Cmd>BufferGoto 6<CR>" },
      { "<A-7>", "<Cmd>BufferGoto 7<CR>" },
      { "<A-8>", "<Cmd>BufferGoto 8<CR>" },
      { "<A-9>", "<Cmd>BufferGoto 9<CR>" },
      { "<A-0>", "<Cmd>BufferLast<CR>" },
      { "<A-p>", "<Cmd>BufferPin<CR>" }, -- Pin/unpin buffer
      { "<A-c>", "<Cmd>BufferClose<CR>" }, -- Close buffer
      { "<C-p>", "<Cmd>BufferPick<CR>" }, -- Magic buffer-picking mode
      { "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>" }, -- Sort automatically by...
      { "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>" },
      { "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>" },
      { "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>" },
      -- Wipeout buffer
      --                 :BufferWipeout
      -- Close commands
      --                 :BufferCloseAllButCurrent
      --                 :BufferCloseAllButPinned
      --                 :BufferCloseAllButCurrentOrPinned
      --                 :BufferCloseBuffersLeft
      --                 :BufferCloseBuffersRight
      -- Other:
      -- :BarbarEnable - enables barbar (enabled by default)
      -- :BarbarDisable - very bad command, should never be used
    },
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },
  {
    "tiagovla/scope.nvim", -- tab scoped buffers (either love or hate)
    opts = {
      restore_state = true, -- false, -- experimental
    },
  },
  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- disable all keys
    -- keys = function()
    --   return {}
    -- end,
    -- stylua: ignore
    keys = function()
      return {
        { "<leader>bc", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
        { "<localleader>c", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
        { "<leader>bC", function() require("mini.bufremove").delete(0, true) end, desc = "Close Buffer (Force)" },
      }
    end,
    -- stylua: ignore
    -- keys = {
    --   { "<leader>bc", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
    --   { "<localleader>c", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
    --   { "<leader>bC", function() require("mini.bufremove").delete(0, true) end, desc = "Close Buffer (Force)" },
    --   { "<leader>bd", false },
    --   { "<leader>bD", false },
    -- },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        offsets = {
          {
            filetype = "undotree",
            text = "Undotree",
            highlight = "PanelHeading",
            padding = 1,
          },
          {
            filetype = "NvimTree",
            text = "Explorer",
            highlight = "PanelHeading",
            padding = 1,
          },
          {
            filetype = "DiffviewFiles",
            text = "Diff View",
            highlight = "PanelHeading",
            padding = 1,
          },
          {
            filetype = "flutterToolsOutline",
            text = "Flutter Outline",
            highlight = "PanelHeading",
          },
          {
            filetype = "lazy",
            text = "Lazy",
            highlight = "PanelHeading",
            padding = 1,
          },
        },
      },
    },
  },
}
