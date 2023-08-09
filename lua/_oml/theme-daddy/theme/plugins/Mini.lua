local M = {}

--- @param c Colorscheme The color theme
M.setup = function(c, _, _)
  return {
    MiniIndentscopeSymbol = { fg = c.base.blue },
  }
end

return M
