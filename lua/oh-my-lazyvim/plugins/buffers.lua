return {
  { -- would have to disable bufferline
    "romgrk/barbar.nvim",
    enabled = false,
    keys = {
      -- Move to previous/next
      { "<leader>b,", "<Cmd>BufferPrevious<cr>" },
      { "<leader>b.", "<Cmd>BufferNext<cr>" },
      { "<leader>b<", "<Cmd>BufferMovePrevious<cr>" }, -- Re-order to previous/next
      { "<leader>b>", "<Cmd>BufferMoveNext<cr>" },
      { "<leader>b1", "<Cmd>BufferGoto 1<cr>" }, -- Goto buffer in position...
      { "<leader>b2", "<Cmd>BufferGoto 2<cr>" },
      { "<leader>b3", "<Cmd>BufferGoto 3<cr>" },
      { "<leader>b4", "<Cmd>BufferGoto 4<cr>" },
      { "<leader>b5", "<Cmd>BufferGoto 5<cr>" },
      { "<leader>b6", "<Cmd>BufferGoto 6<cr>" },
      { "<leader>b7", "<Cmd>BufferGoto 7<cr>" },
      { "<leader>b8", "<Cmd>BufferGoto 8<cr>" },
      { "<leader>b9", "<Cmd>BufferGoto 9<cr>" },
      { "<leader>b0", "<Cmd>BufferLast<cr>" },
      { "<leader>bp", "<Cmd>BufferPin<cr>" }, -- Pin/unpin buffer
      { "<leader>bc", "<Cmd>BufferClose<cr>" }, -- Close buffer
      { "<leader>bp", "<Cmd>BufferPick<cr>" }, -- Magic buffer-picking mode
      { "<leader>bb", "<Cmd>BufferOrderByBufferNumber<cr>" }, -- Sort automatically by...
      { "<leader>bd", "<Cmd>BufferOrderByDirectory<cr>" },
      { "<leader>bl", "<Cmd>BufferOrderByLanguage<cr>" },
      { "<leader>bw", "<Cmd>BufferOrderByWindowNumber<cr>" },
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
