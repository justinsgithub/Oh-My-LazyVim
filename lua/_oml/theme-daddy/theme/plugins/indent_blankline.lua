local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
M.setup = function(c, config, _)
  local isContextStartUnderline = config.plugins.indent_blankline.context_start_underline
  return {
    IndentBlanklineChar = { fg = c.editorIndentGuide.background },
    IndentBlanklineContextChar = {
      fg = c.editorIndentGuide.activeBackground,
    },
    IndentBlanklineContextStart = {
      sp = c.editorIndentGuide.activeBackground,
      underline = isContextStartUnderline,
    },
    IndentBlanklineSpaceChar = { fg = c.editor.background }, -- highlight the character Tab
    IndentBlankLineIndent1 = { fg = c.base.red },
    IndentBlankLineIndent2 = { fg = c.base.blue },
    IndentBlankLineIndent3 = { fg = c.base.yellow },
    IndentBlankLineIndent4 = { fg = c.base.green },
    IndentBlankLineIndent5 = { fg = c.base.cyan },
    IndentBlankLineIndent6 = { fg = c.base.magenta },
  }
end

return M
