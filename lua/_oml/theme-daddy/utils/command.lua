local utils = require("_oml.theme-daddy.utils")
local config = require("_oml.theme-daddy.utils.config")

local M = {}

M.create_theme_command = function()
  local cmd = vim.api.nvim_create_user_command

  cmd("ThemeDaddy", function(opts)
    -- show menu if no theme is passed
    if not opts.fargs[1] then
      local menu = utils.create_menu("Change Theme", utils.themes, function(item)
        local theme = item.value
        config.extend({ theme = theme })
        vim.cmd([[colorscheme theme-daddy]])
      end)
      assert(menu, "Error: Fail to create menu")
      menu:mount()
    end

    local theme = opts.fargs[1]
    config.extend({ theme = theme })
    vim.cmd([[colorscheme theme-daddy]])
  end, {
    nargs = "?",
    complete = utils.get_themes,
  })
end

return M
