return {
  {
    "echasnovski/mini.surround",
    enabled = true,
    opts = {
      mappings = {
        add = "<localleader>sa",
        delete = "<localleader>sd",
        find = "<localleader>sf",
        find_left = "<localleader>sF",
        highlight = "<localleader>sh",
        replace = "<localleader>sr",
        update_n_lines = "<localleader>sn",
      },
    },
  },
  {
    "kylechui/nvim-surround", -- may prefer over mini.surround, switch enabled on them
    enabled = false,
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}
