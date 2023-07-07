return {
  {
    "ecthelionvi/NeoComposer.nvim",
    enabled = not jit.os:find("Windows"), -- needs sqlite.lua which i think may not work on windows?
    dependencies = {
      "kkharji/sqlite.lua",
      enabled = not jit.os:find("Windows"), -- needs sqlite.lua which i think may not work on windows?
    },
    opts = {
      notify = true,
      delay_timer = 150,
      colors = {
        bg = "#16161e",
        fg = "#ff9e64",
        red = "#ec5f67",
        blue = "#5fb3b3",
        green = "#99c794",
      },
      keymaps = {
        play_macro = "Q",
        yank_macro = "yq",
        stop_macro = "cq",
        toggle_record = "q",
        cycle_next = "<c-n>",
        cycle_prev = "<c-p>",
        toggle_macro_menu = "<m-q>",
      },
    },
  },
  {
    "gbprod/yanky.nvim",
    keys = {
      { "<leader>p", false },
        -- stylua: ignore
      { "<leader>Y", function() require("telescope").extensions.yank_history.yank_history({ }) end, desc = "Open Yank History" },
    },
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("telescope").load_extension("harpoon")
    end,
  },
  {
    "crusj/bookmarks.nvim",
    keys = {
      { "<tab><tab>", mode = { "n" } },
    },
    branch = "main",
    dependencies = { "nvim-web-devicons" },
    config = function()
      require("bookmarks").setup()
      require("telescope").load_extension("bookmarks")
    end,
  },
}
