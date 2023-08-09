local M = {}

--- @param c Colorscheme The color theme
-- --- @param _config Config
M.setup = function(c, _, _)
  return c.base.treesitter
end

return M
