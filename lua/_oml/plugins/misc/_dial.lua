-- better incrementing / decrementing

local map = require("_oml.utils").keymap

return {
  "monaqa/dial.nvim",
  enabled = true,
  config = function()
    map("n", "<C-a>", require("dial.map").inc_normal())
    map("n", "<C-x>", require("dial.map").dec_normal())
    map("n", "g<C-a>", require("dial.map").inc_gnormal())
    map("n", "g<C-x>", require("dial.map").dec_gnormal())
    map("v", "<C-a>", require("dial.map").inc_visual())
    map("v", "<C-x>", require("dial.map").dec_visual())
    map("v", "g<C-a>", require("dial.map").inc_gvisual())
    map("v", "g<C-x>", require("dial.map").dec_gvisual())
  end,
}
