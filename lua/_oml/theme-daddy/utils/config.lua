local is_theme, theme_config = pcall(require, "config.theme")
local M = {}

---@class Config
---@field override fun(colors: Colorscheme)
local default = {
  transparent_background = true,
  theme = "default",
  terminal_colors = true,
  devicons = false,
  inc_search = "background", -- underline | background
  background_clear = {
    -- "float_win",
    "toggleterm",
    "telescope",
    "which-key",
    "renamer",
    -- "neo-tree",
  },
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
      bold = true,
    },
    indent_blankline = {
      context_start_underline = false,
    },
  },
  ---@param colors Colorscheme
  override = function(colors) end,
}

if is_theme then
  if theme_config.transparent_background then
    default.transparent_background = theme_config.transparent_background
  end
  if theme_config.theme then
    default.theme = theme_config.theme
  end
end

---@type Config
M.options = {}

---@param options Config|nil
M.setup = function(options)
  M.options = vim.tbl_deep_extend("force", {}, default, options or {})
end

---@param options Config|nil
M.extend = function(options)
  M.options = vim.tbl_deep_extend("force", {}, M.options or default, options or {})
end

M.setup()

return M
