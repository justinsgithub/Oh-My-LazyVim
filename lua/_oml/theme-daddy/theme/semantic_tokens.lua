local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
M.setup = function(c, config, _)
  return {
    -- type
    ["@lsp.type.class"] = { link = "Structure" },
    ["@lsp.type.decorator"] = { link = "Function" },
    ["@lsp.type.enum"] = { link = "Structure" },
    ["@lsp.type.enumNumber"] = { link = "Constant" },
    ["@lsp.type.function"] = { link = "Function" },
    ["@lsp.type.interface"] = { link = "Structure" },
    ["@lsp.type.macro"] = { link = "Macro" },
    ["@lsp.type.method"] = { link = "Function" },
    ["@lsp.type.namespace"] = { link = "Identifier" },
    ["@lsp.type.parameter"] = { link = "Identifier" },
    ["@lsp.type.property"] = { link = "Identifier" },
    ["@lsp.type.struct"] = { link = "Structure" },
    ["@lsp.type.type"] = { link = "Type" },
    ["@lsp.type.typeParameter"] = { link = "TypeDef" },
    ["@lsp.type.variable"] = { link = "Identifier" },

    -- mod
    -- ["@lsp.mod.declaration"] = { fg = c.base.cyan },
    -- ["@lsp.mod.definition"] = { fg = c.base.cyan },
    -- ["@lsp.mod.readonly"] = { fg = c.base.magenta },
    -- ["@lsp.mod.static"] = {},
    ["@lsp.mod.deprecated"] = { strikethrough = true },
    -- ["@lsp.mod.abstract"] = {},
    -- ["@lsp.mod.async"] = {},
    -- ["@lsp.mod.modification"] = {},
    -- ["@lsp.mod.documentation"] = {},
    -- ["@lsp.mod.defaultLibrary"] = {},

    ["@lsp.typemod.class.defaultLibrary"] = { fg = c.base.white },
    -- ["@lsp.typemod.decorator"] = {},
    -- ["@lsp.typemod.enum"] = {},
    -- ["@lsp.typemod.enumNumber"] = {},
    ["@lsp.typemod.function.declaration"] = { fg = c.base.green },
    ["@lsp.typemod.function.defaultLibrary"] = { fg = c.base.blue },
    -- ["@lsp.typemod.interface"] = {},
    -- ["@lsp.typemod.macro"] = {},
    -- ["@lsp.typemod.method"] = {},
    -- ["@lsp.typemod.namespace"] = {},
    ["@lsp.typemod.parameter.declaration"] = { fg = c.base.blue, italic = c.base.styles.parameter.italic },
    -- ["@lsp.typemod.property"] = {},
    -- ["@lsp.typemod.struct"] = {},
    -- ["@lsp.typemod.type"] = {},
    -- ["@lsp.typemod.typeParameter"] = {},
    ["@lsp.typemod.variable.readonly"] = { fg = c.base.magenta },
  }
end

return M
