local c = require("_oml.theme-daddy.colorscheme").colors
if not c or not c.editor then
  c = require("_oml.theme-daddy.colorscheme").setup("default")
end

local M = {
  normal = { bg = c.editor.background, fg = c.breadcrumb.foreground },
  ellipsis = { fg = c.breadcrumb.foreground },
  separator = { fg = c.breadcrumb.foreground },
  modified = { fg = c.base.yellow },
  dirname = { fg = c.breadcrumb.foreground },
  basename = { fg = c.breadcrumb.foreground, bold = true },
  context = { fg = c.breadcrumb.foreground },
  context_array = { fg = c.base.red },
  context_boolean = { fg = c.base.red },
  context_class = { fg = c.base.cyan },
  context_constant = { fg = c.base.magenta },
  context_constructor = { fg = c.base.green },
  context_enum = { fg = c.base.blue },
  context_enum_member = { fg = c.base.blue },
  context_event = { fg = c.base.blue },
  context_field = { fg = c.base.blue },
  context_file = { fg = c.editorLineNumber.activeForeground },
  context_function = { fg = c.base.green },
  context_interface = { fg = c.base.cyan },
  context_key = { fg = c.base.blue },
  context_method = { fg = c.base.green },
  context_module = { fg = c.base.cyan },
  context_namespace = { fg = c.base.cyan },
  context_null = { fg = c.base.magenta },
  context_number = { fg = c.base.magenta },
  context_object = { fg = c.base.cyan },
  context_operator = { fg = c.base.red },
  context_package = { fg = c.base.magenta },
  context_property = { fg = c.base.blue },
  context_string = { fg = c.base.yellow },
  context_struct = { fg = c.base.red },
  context_type_parameter = { fg = c.base.blue },
  context_variable = { fg = c.base.cyan },
}

return M
