return {
  "folke/trouble.nvim",
  opts = { use_diagnostic_signs = true },
  keys = {
    { "<leader>xx", false },
    { "<leader>xX", false },
    { "<leader>xL", false },
    { "<leader>xQ", false },
    { "<leader>dx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
    { "<leader>dX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    { "<leader>dL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
    { "<leader>dQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
  },
}
