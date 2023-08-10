return {
  "kylechui/nvim-surround", -- may prefer over mini.surround, make sure to change enabled fields as needed
  enabled = false,
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
}
