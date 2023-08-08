local colorscheme = function()
  require("_oml.theme-daddy").setup({
    -- transparent_background = false -- default is true
    palette = "justinsgithub",
  })
  return "theme-daddy"
end

return {
  "LazyVim/LazyVim",
  enabled = true,
  opts = {
    -- call function to setup colorscheme options
    -- normally would be done automatically but theme-daddy is your own config, not a third-party plugin
    colorscheme = colorscheme(),
  },
}
