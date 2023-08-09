local M = {}
--- @param c Colorscheme The color theme
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
    IndentBlankLineIndent3 = { fg = c.base.yellow },
    IndentBlankLineIndent2 = { fg = c.base.pink },
    IndentBlankLineIndent4 = { fg = c.base.green },
    IndentBlankLineIndent5 = { fg = c.base.cyan },
    IndentBlankLineIndent6 = { fg = c.base.magenta },
  }
end

return M
