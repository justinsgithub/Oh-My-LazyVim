return {
  "iamcco/markdown-preview.nvim",
  -- build = "cd app && npm install",
  build = ":call mkdp#util#install()", -- USE THIS INSTEAD OF ABOVE LINE FOR LAZY
  ft = "markdown",
  config = function()
    vim.g.mkdp_auto_start = 1
  end,
}
