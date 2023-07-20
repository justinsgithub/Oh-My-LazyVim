return {
  "gbprod/yanky.nvim",
  keys = {
    { "<leader>p", false },
        -- stylua: ignore
      { "<leader>Y", function() require("telescope").extensions.yank_history.yank_history({ }) end, desc = "Open Yank History" },
  },
}
