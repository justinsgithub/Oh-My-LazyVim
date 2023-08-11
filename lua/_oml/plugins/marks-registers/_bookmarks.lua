return {
  "crusj/bookmarks.nvim",
  keys = {
    {
      "<Leader><Tab>b",
      desc = "Bookmarks",
    },
  },
  branch = "main",
  dependencies = { "nvim-web-devicons" },
  config = function()
    require("bookmarks").setup()
    require("telescope").load_extension("bookmarks")
  end,
}
