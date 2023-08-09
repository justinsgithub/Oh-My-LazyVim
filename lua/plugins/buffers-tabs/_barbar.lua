return { -- would have to disable bufferline
  "romgrk/barbar.nvim",
  enabled = false,
  keys = {
    -- Move to previous/next
    { "<leader><tab>,", "<Cmd>BufferPrevious<cr>" },
    { "<leader><tab>.", "<Cmd>BufferNext<cr>" },
    { "<leader><tab><", "<Cmd>BufferMovePrevious<cr>" }, -- Re-order to previous/next
    { "<leader><tab>>", "<Cmd>BufferMoveNext<cr>" },
    { "<leader><tab>1", "<Cmd>BufferGoto 1<cr>" }, -- Goto buffer in position...
    { "<leader><tab>2", "<Cmd>BufferGoto 2<cr>" },
    { "<leader><tab>3", "<Cmd>BufferGoto 3<cr>" },
    { "<leader><tab>4", "<Cmd>BufferGoto 4<cr>" },
    { "<leader><tab>5", "<Cmd>BufferGoto 5<cr>" },
    { "<leader><tab>6", "<Cmd>BufferGoto 6<cr>" },
    { "<leader><tab>7", "<Cmd>BufferGoto 7<cr>" },
    { "<leader><tab>8", "<Cmd>BufferGoto 8<cr>" },
    { "<leader><tab>9", "<Cmd>BufferGoto 9<cr>" },
    { "<leader><tab>0", "<Cmd>BufferLast<cr>" },
    { "<leader><tab>p", "<Cmd>BufferPin<cr>" }, -- Pin/unpin buffer
    { "<leader><tab>c", "<Cmd>BufferClose<cr>" }, -- Close buffer
    { "<leader><tab>p", "<Cmd>BufferPick<cr>" }, -- Magic buffer-picking mode
    { "<leader><tab>b", "<Cmd>BufferOrderByBufferNumber<cr>" }, -- Sort automatically by...
    { "<leader><tab>d", "<Cmd>BufferOrderByDirectory<cr>" },
    { "<leader><tab>l", "<Cmd>BufferOrderByLanguage<cr>" },
    { "<leader><tab>w", "<Cmd>BufferOrderByWindowNumber<cr>" },
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
}
