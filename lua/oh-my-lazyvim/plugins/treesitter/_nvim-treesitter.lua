return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  opts = {
    autotag = {
      enable = true,
    },
    -- add more treesitter parsers
    -- Personally I would just say ensure_installed = all
    -- ensure_installed = "all", -- will want to let neovim chill a minute while they are all installed
    ensure_installed = {
      "bash",
      "html",
      "http",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
  },
}
