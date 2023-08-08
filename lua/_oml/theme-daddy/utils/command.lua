local utils = require("_oml.theme-daddy.utils")
local config = require("_oml.theme-daddy.utils.config")
local palettes = require("_oml.theme-daddy.colorscheme.palettes")

local M = {}

M.create_palette_command = function()
	local cmd = vim.api.nvim_create_user_command

	cmd("ThemeDaddy", function(opts)
		-- show menu if no theme is passed
		if not opts.fargs[1] then
			local menu = utils.create_menu("Change Palette", palettes, function(item)
				local palette = item.value
				config.extend({ palette = palette })
				vim.cmd([[colorscheme theme-daddy]])
			end)
			assert(menu, "Error: Fail to create menu")
			menu:mount()
		end

		local palette = opts.fargs[1]
		config.extend({ palette = palette })
		vim.cmd([[colorscheme theme-daddy]])
	end, {
		nargs = "?",
		complete = function()
			return palettes
		end,
	})
end

return M
