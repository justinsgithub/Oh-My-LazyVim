local htmlsnip = JOINPATHS(SNIPSDIR, "html.txt")
local fl = vim.fn.getline(1)

local d1 = "<!DOCTYPE html>"
local d2 = "<!DOCTYPE HTML>"
local d3 = "<!doctype html>"
local d4 = "<!doctype HTML>"
local writefile = fl ~= d1 or fl ~= d2 or fl ~= d3 or fl ~= d4

if writefile then
  vim.api.nvim_cmd({ cmd = "r", args = { htmlsnip } }, {})
end

-- vim.cmd.delete({ count = 2 })
-- vim.cmd.delete(2) ? should work but doesn't
