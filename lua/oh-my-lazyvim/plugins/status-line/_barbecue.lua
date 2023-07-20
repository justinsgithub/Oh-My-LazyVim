return {
  -- nice winbar can click on items to jump to them like VS****)
  "utilyre/barbecue.nvim",
  name = "barbecue",
  -- version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
  },
  -- hide barbecue globally
  -- require("barbecue.ui").toggle(false)

  -- show barbecue globally
  -- require("barbecue.ui").toggle(true)

  -- toggle barbecue globally
  -- require("barbecue.ui").toggle()
  -- navigate to the second entry
  -- require("barbecue.ui").navigate(2)

  -- navigate to the last entry
  -- require("barbecue.ui").navigate(-1)

  -- just like before but on the given window
  -- require("barbecue.ui").navigate(index, winnr)
}
