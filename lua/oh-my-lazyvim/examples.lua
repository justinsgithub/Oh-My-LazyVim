---@param opts Opts
vim.api.nvim_create_user_command("IsPackageLoaded", function(opts)
  print(package.loaded[opts.fargs[1]])
end, {
  desc = "check if package is loaded",
  force = true,
  nargs = 1,
})

GetRuntimePaths = function()
  TempTable(vim.api.nvim_list_runtime_paths())
end
