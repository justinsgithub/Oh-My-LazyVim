-- WARN: do not have to use this theme, but should not delete this file
-- have not added error handling yet if this file is not found or does not return {custom, theme, transparent}

-- customize to your liking
local palette = require("_oml.theme-daddy.colorscheme.palette")
local darkerergrey = palette.darkerergrey
local darkestgrey = palette.darkestgrey
local dirtywhite = palette.dirtywhite
local darkorange = palette.darkorange
local lightgrey = palette.lightgrey
local darkgrey = palette.darkgrey
local darkergrey = palette.darkergrey
local bluegrey = palette.bluegrey
local red = "#ff3f4f"
local black = "#19181a"
local white = "#fcfcfa"
local magenta = "#bf40bf"
local purple = "#e542ff"
local yellow = "#ffd945"
local orange = "#ff8b39"
local green = "#81f900"
local leaf = "#6fd80d"
local blue = "#007dd8"
local sky = "#00a0e4"
local teal = "#19d1e5"
local pink = "#ff007c"
local cyan = "#00dfff"
local grey = "#939293"
local dimmed2 = grey -- border ?
local dark1 = darkerergrey
local sideBar = {
  background = dark1,
  foreground = dimmed2,
}

local styles = {
  comment = { italic = true },
  keyword = { italic = true }, -- any other keyword
  type = { italic = true }, -- (preferred) int, long, char, etc
  storageclass = { italic = true }, -- static, register, volatile, etc
  structure = { italic = true }, -- struct, union, enum, etc
  parameter = { italic = true }, -- parameter pass in function
  annotation = { italic = true },
  tag_attribute = { italic = true }, -- attribute of tag in reactjs, html, etc...
}

local treesitter = {
  ["@include"] = { fg = pink }, -- `import`
  ["@variable"] = { fg = blue },
  ["@punctuation.delimiter"] = { fg = dimmed2 }, -- `;`
  ["@punctuation.bracket"] = { fg = dimmed2 }, -- `(`
  ["@constructor"] = { fg = red }, -- `StrictMode` in `<React.StrictMode>`
  ["@tag.delimiter"] = { fg = dimmed2 }, -- `<`, `>` in `<div>`
  ["@operator"] = { fg = pink }, -- `=`, `=>`
  ["@keyword"] = { fg = pink, italic = styles.keyword.italic }, -- `const`, `export`, `default`
  ["@parameter"] = { fg = orange },

  ["@keyword.return"] = { fg = red },
  ["@keyword.operator"] = { fg = red },
  ["@method.call"] = { fg = green },
  ["@property"] = { fg = green },
  ["@function"] = { fg = green },
  ["@constant.builtin"] = { fg = pink },
  ["@tag"] = { fg = red },
  ["@tag.attribute"] = { fg = blue, italic = styles.tag_attribute.italic },
  ["@attribute"] = { fg = blue },
  ["@conditional"] = { fg = red },
  ["@repeat"] = { fg = red },
  ["@keyword.function"] = { fg = blue, bold = true, italic = styles.keyword.italic },
  ["@number"] = { fg = magenta },
  ["@boolean"] = { fg = magenta },
  ["@type.qualifier"] = { fg = red, italic = styles.type.italic },
  ["@annotation"] = { fg = blue, italic = styles.annotation.italic },
  ["@field"] = { fg = red },
  -- scss
  ["@keyword.scss"] = { fg = red },
  ["@function.scss"] = { fg = blue },
  ["@property.scss"] = { fg = green },
  ["@string.scss"] = { fg = cyan, italic = true },
  ["@number.scss"] = { fg = magenta },
  ["@type.scss"] = { fg = blue },
  -- cpp
  ["@keyword.cpp"] = { fg = blue, italic = styles.keyword.italic },
  ["@namespace.cpp"] = { fg = white },
  ["@operator.cpp"] = { fg = red },
  ["@type.cpp"] = { fg = cyan, italic = styles.type.italic },
  ["@variable.cpp"] = { fg = white },
  ["@constant.cpp"] = { fg = blue },
  ["@constant.macro.cpp"] = { fg = red },
  ["@punctuation.delimiter.cpp"] = { fg = sideBar.foreground },
  -- python
  ["@type.python"] = { fg = blue },
  ["@keyword.python"] = { fg = blue, italic = styles.keyword.italic },
  ["@variable.builtin.python"] = {
    -- fg = c.editorSuggestWidget.green, -- idk why green is there
    fg = green,
    italic = true,
  },
  ["@field.python"] = { fg = green },
  ["@variable.python"] = { fg = white },
  ["@constructor.python"] = { fg = green },
  ["@method.python"] = { fg = green },
  ["@function.builtin.python"] = { fg = blue, italic = true },
  ["@exception.python"] = { fg = red, italic = true },
  ["@constant.python"] = { fg = pink },
  ["@keyword.function.python"] = { fg = blue, italic = styles.keyword.italic },
  ["@operator.python"] = { fg = red },
  ["@varibale.builtin.python"] = { fg = cyan, italic = true },
  -- lua
  ["@variable.lua"] = { fg = white },
  ["@function.builtin.lua"] = { fg = green },
  ["@field.lua"] = { fg = white },
  ["@keyword.lua"] = { fg = red, italic = styles.keyword.italic },
  ["@keyword.function.lua"] = { fg = red },
  ["@conditional.lua"] = { fg = red },
  ["@namespace.lua"] = { fg = red },
}

local custom_theme = {
  sideBar = sideBar,
  background = darkestgrey,
  text = dirtywhite,
  dark = black,
  dark1 = dark1,
  dark2 = black,
  accent1 = red,
  accent2 = orange,
  accent3 = yellow,
  accent4 = green,
  accent5 = sky,
  dimmed1 = lightgrey,
  dimmed2 = dimmed2, -- border
  dimmed3 = darkgrey,
  dimmed4 = bluegrey,
  dimmed5 = darkergrey,
  delimiter = white,
  character = magenta,
  number = magenta,
  boolean = magenta,
  float = magenta,
  op = red,
  exc = red,
  kword = red,
  label = red,
  peat = red,
  statement = red,
  include = red,
  define = red,
  macro = red,
  precondit = red,
  preproc = yellow,
  str = yellow,
  identifier = orange,
  func = green,
  type = blue,
  todo = pink,
  typedef = pink,
  storageclass = pink,
  conditional = pink,
  constant = pink,
  special = cyan,
  specialchar = cyan,
  structure = cyan,
  specialcomment = darkgrey,
  comment = darkgrey,
  styles = styles,
  blue = blue,
  leaf = leaf,
  dark_orange = darkorange,
  orange = orange,
  white = white,
  magenta = magenta,
  purple = purple,
  red = red,
  yellow = yellow,
  green = green,
  sky = sky,
  teal = teal,
  cyan = cyan,
  pink = pink,
  black = black,
}

custom_theme.treesitter = treesitter

local M = {
  custom = custom_theme,
  theme = "custom", -- sets default theme, only custom and default are available right now
  transparent_background = true, -- true or false
}

return M
