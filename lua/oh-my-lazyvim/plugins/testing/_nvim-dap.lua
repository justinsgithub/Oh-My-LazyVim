return {
  "mfussenegger/nvim-dap",
  optional = true,
    -- stylua: ignore
    keys = {
      { "<leader>Td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Debug Nearest" },
    },
}
