local M = {}

--- @param c Colorscheme The color palette
-- --- @param _config Config
M.setup = function(c, _, _)
  local styles = c.base.styles
  return {
    ["@include"] = { fg = c.base.pink }, -- `import`
    ["@variable"] = { fg = c.base.blue },
    ["@punctuation.delimiter"] = { fg = c.base.dimmed2 }, -- `;`
    ["@punctuation.bracket"] = { fg = c.base.dimmed2 }, -- `(`
    ["@constructor"] = { fg = c.base.red }, -- `StrictMode` in `<React.StrictMode>`
    ["@tag.delimiter"] = { fg = c.base.dimmed2 }, -- `<`, `>` in `<div>`
    ["@operator"] = { fg = c.base.pink }, -- `=`, `=>`
    ["@keyword"] = { fg = c.base.pink, italic = styles.keyword.italic }, -- `const`, `export`, `default`
    ["@parameter"] = { fg = c.base.orange,  },

    ["@keyword.return"] = { fg = c.base.red },
    ["@keyword.operator"] = { fg = c.base.red },
    ["@method.call"] = { fg = c.base.green },
    ["@property"] = { fg = c.base.green },
    ["@function"] = { fg = c.base.green },
    ["@constant.builtin"] = { fg = c.base.pink },
    ["@tag"] = { fg = c.base.red },
    ["@tag.attribute"] = { fg = c.base.blue, italic = styles.tag_attribute.italic },
    ["@attribute"] = { fg = c.base.blue },
    ["@conditional"] = { fg = c.base.red },
    ["@repeat"] = { fg = c.base.red },
    ["@keyword.function"] = { fg = c.base.blue, bold = true, italic = styles.keyword.italic },
    ["@number"] = { fg = c.base.magenta },
    ["@boolean"] = { fg = c.base.magenta },
    ["@type.qualifier"] = { fg = c.base.red, italic = styles.type.italic },
    ["@annotation"] = { fg = c.base.blue, italic = styles.annotation.italic },
    ["@field"] = { fg = c.base.red },
    -- scss
    ["@keyword.scss"] = { fg = c.base.red },
    ["@function.scss"] = { fg = c.base.blue },
    ["@property.scss"] = { fg = c.base.green },
    ["@string.scss"] = { fg = c.base.cyan, italic = true },
    ["@number.scss"] = { fg = c.base.magenta },
    ["@type.scss"] = { fg = c.base.blue },
    -- cpp
    ["@keyword.cpp"] = { fg = c.base.blue, italic = styles.keyword.italic },
    ["@namespace.cpp"] = { fg = c.base.white },
    ["@operator.cpp"] = { fg = c.base.red },
    ["@type.cpp"] = { fg = c.base.cyan, italic = styles.type.italic },
    ["@variable.cpp"] = { fg = c.base.white },
    ["@constant.cpp"] = { fg = c.base.blue },
    ["@constant.macro.cpp"] = { fg = c.base.red },
    ["@punctuation.delimiter.cpp"] = { fg = c.sideBar.foreground },
    -- python
    ["@type.python"] = { fg = c.base.blue },
    ["@keyword.python"] = { fg = c.base.blue, italic = styles.keyword.italic },
    ["@variable.builtin.python"] = {
      fg = c.editorSuggestWidget.green,
      italic = true,
    },
    ["@field.python"] = { fg = c.base.green },
    ["@variable.python"] = { fg = c.base.white },
    ["@constructor.python"] = { fg = c.base.green },
    ["@method.python"] = { fg = c.base.green },
    ["@function.builtin.python"] = { fg = c.base.blue, italic = true },
    ["@exception.python"] = { fg = c.base.red, italic = true },
    ["@constant.python"] = { fg = c.base.pink },
    ["@keyword.function.python"] = { fg = c.base.blue, italic = styles.keyword.italic },
    ["@operator.python"] = { fg = c.base.red },
    ["@varibale.builtin.python"] = { fg = c.base.cyan, italic = true },
    -- lua
    ["@variable.lua"] = { fg = c.base.white },
    ["@function.builtin.lua"] = { fg = c.base.green },
    ["@field.lua"] = { fg = c.base.white },
    ["@keyword.lua"] = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.function.lua"] = { fg = c.base.red },
    ["@conditional.lua"] = { fg = c.base.red },
    ["@namespace.lua"] = { fg = c.base.red },
  }
end

return M
