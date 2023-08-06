return {
  "folke/todo-comments.nvim",
  keys = {
    { "<leader>xt", false },
    { "<leader>xT", false },
    { "<leader>dt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    { "<leader>dT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
  },
}
