-- random helper functions for OML config development
-- not being required or used anywhere
-- keeping in config for examples to learn from
vim.api.nvim_create_user_command("PluginsMacro", function(_)
  -- local srcpath = "src/" .. vim.api.nvim_eval("expand('<cWORD>')")
  -- vim.cmd("e " .. srcpath)
  local currentfilepath = vim.api.nvim_eval("expand('%')") -- returns path to current file lua/_oml/utils/_helpers.lua
  local path_split = vim.fn.split(currentfilepath, "/") -- returns table ( array kindof ) {"lua", "_oml", "utils", "_helpers.lua" }
  local filename = path_split[#path_split] -- get last item in table ( helpers.lua )
  local requirename = string.gsub(filename, "%.lua?$", "") -- trim off .lua\n
  local parent_dir = path_split[#path_split - 1] -- utils
  local require_string = vim.fn.join({ "_oml.plugins", parent_dir, requirename }, ".")
  local require_statement = 'local plugin_spec = require("' .. require_string .. '")'
  vim.cmd("normal i" .. require_statement)
end, {
  desc = "Command to help reorganize plugins",
  force = true,
  nargs = 0,
})
