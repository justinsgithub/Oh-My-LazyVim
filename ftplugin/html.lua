local htmlsnip = JOINPATHS(SNIPSDIR, "html.txt")

local firstline = vim.fn.getline(1)
print(firstline)
if firstline ~= "<!DOCTYPE html>" then
  vim.api.nvim_cmd({ cmd = "r", args = { htmlsnip } }, {})
end

-- vim.cmd.delete({ count = 2 })
-- vim.cmd.delete(2) does not work?
