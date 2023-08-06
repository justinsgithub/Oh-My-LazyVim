-- buffer remove
return
-- buffer remove
{
  "echasnovski/mini.bufremove",
    -- disable all keys
    -- keys = function()
    --   return {}
    -- end,
    -- stylua: ignore
    keys = function()
      return {
        { "<leader>bc", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
        { "<localleader>c", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
        { "<leader>bC", function() require("mini.bufremove").delete(0, true) end, desc = "Close Buffer (Force)" },
      }
    end,
  -- stylua: ignore
  -- keys = {
  --   { "<leader>bc", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
  --   { "<localleader>c", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
  --   { "<leader>bC", function() require("mini.bufremove").delete(0, true) end, desc = "Close Buffer (Force)" },
  --   { "<leader>bd", false },
  --   { "<leader>bD", false },
  -- },
}
