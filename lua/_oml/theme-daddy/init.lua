local config = require("_oml.theme-daddy.utils.config")
local utils = require("_oml.theme-daddy.utils")
local theme = require("_oml.theme-daddy.theme")
local command = require("_oml.theme-daddy.utils.command")

local M = {}

M.load = function()
  utils.load(theme.setup())
end

M.setup = function(options)
  config.setup(options)
  command.create_theme_command()
end

M.get_base_color = function()
  local base_color = require("_oml.theme-daddy.colorscheme").colors.base
  return base_color
end

return M
