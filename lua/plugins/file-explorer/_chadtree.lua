local keys = {
  {
    "<leader>e",
    "<cmd>CHADopen<cr>",
    desc = "Explorer",
  },
}

return {
  "ms-jpq/chadtree",
  enabled = false,
  keys = keys,
  build = "python3 -m chadtree deps",
}
