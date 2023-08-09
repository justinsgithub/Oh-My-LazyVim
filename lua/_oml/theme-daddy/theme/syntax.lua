local M = {}

--- @param c Colorscheme The color theme
--- @param config Config
M.setup = function(c, config, _)
  local _ = config
  return {
    Comment = { fg = c.base.comment, italic = c.base.styles.comment.italic }, -- Comments
    Constant = { fg = c.base.constant }, -- (preferred) any constant
    String = { fg = c.base.str }, --   a string constant: "this is a string"
    Character = { fg = c.base.character }, -- a character constant: 'c', '\n'
    Number = { fg = c.base.number }, -- a number constant: 234, 0xff
    Boolean = { fg = c.base.boolean }, -- a boolean constant: TRUE, false
    Float = { fg = c.base.float }, -- a floating point constant: 2.3e10
    Identifier = { fg = c.base.identifier }, -- (preferred) any variable name
    Function = { fg = c.base.func }, -- function name (also: methods for classes)
    Statement = { fg = c.base.statement }, -- (preferred) any statement
    Conditional = { fg = c.base.conditional }, --  if, then, else, endif, switch, etc
    Repeat = { fg = c.base.peat }, -- for, do, while, etc
    Label = { fg = c.base.label }, -- case, default, etc
    Operator = { fg = c.base.op }, -- "sizeof", "+", "*", etc
    Keyword = { fg = c.base.kword, italic = c.base.styles.keyword.italic }, -- any other keyword
    Exception = { fg = c.base.exc }, -- try, catch, throw
    PreProc = { fg = c.base.preproc }, -- (preferred) generic Preprocessor
    Include = { fg = c.base.include }, -- preprocessor #include
    Define = { fg = c.base.define }, -- preprocessor #define
    Macro = { fg = c.base.macro }, -- same as Define
    PreCondit = { fg = c.base.precondit }, -- preprocessor #if, #else, #endif, etc
    Type = { fg = c.base.type }, -- React, ReactDOM (import React from 'react';)
    StorageClass = { fg = c.base.storageclass, italic = c.base.styles.type.italic }, -- static, register, volatile, etc
    Structure = { fg = c.base.structure, italic = c.base.styles.type.italic }, -- struct, union, enum, etc
    Typedef = { fg = c.base.typedef }, -- A typedef
    Special = { fg = c.base.special }, -- (preferred) any special symbol
    SpecialChar = { fg = c.base.specialchar }, -- special character in a constant
    Tag = { fg = c.base.tag }, -- you can use CTRL-] on this
    Delimiter = { fg = c.base.delimiter }, -- character that needs attention
    SpecialComment = { fg = c.base.specialcomment }, -- special things inside a comment
    -- Debug = {}, -- debugging statements
    Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
    Bold = { bold = true },
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|
    Italic = { italic = true },
    Error = { fg = c.inputValidation.errorForeground }, -- (preferred) any erroneous construct
    Todo = {
      bg = c.editor.background,
      fg = c.base.todo,
      bold = true,
    }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    javaAnnotation = { fg = c.base.dimmed2 },
  }
end

return M
