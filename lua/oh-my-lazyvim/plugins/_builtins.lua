
-- just meant to be a reference, all the plugins that come with LazyVim
-- stylua: ignore
if true then return {} end

return {
  -- enabled plugins
  { "lewis6991/gitsigns.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-neo-tree/neo-tree.nvim" }, -- disabled, replaced with nvim-tree for better integration with project.nvim, see plugins/trees.lua
  { "nvim-pack/nvim-spectre" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "rcarriga/nvim-notify" },
  { "stevearc/dressing.nvim" },
  { "tpope/vim-repeat" },
  -- LSP (enabled)
  { "folke/neoconf.nvim" },
  { "folke/neodev.nvim" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "mason.nvim" },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason-lspconfig.nvim" },
  { "williamboman/mason.nvim" },
  -- Extra plugins (disabled, must manually enable)
  { "Saecki/crates.nvim" },
  { "ahmedkhalf/project.nvim" }, -- Already enabled, comment out line in config/lazy.lua to disable
  { "b0o/SchemaStore.nvim" },
  { "echasnovski/mini.animate" },
  { "echasnovski/mini.files" },
  { "echasnovski/mini.hipatterns" },
  { "echasnovski/mini.starter" },
  { "echasnovski/mini.starter" },
  { "folke/edgy.nvim" },
  { "gbprod/yanky.nvim" },
  { "jay-babu/mason-nvim-dap.nvim" },
  { "jbyuki/one-small-step-for-vimkind" },
  { "jfpedroza/neotest-elixir" },
  { "jose-elias-alvarez/typescript.nvim" },
  { "kkharji/sqlite.lua" },
  { "mfussenegger/nvim-dap" },
  { "nvim-neotest/neotest" },
  { "nvim-neotest/neotest-go" },
  { "olimorris/neotest-rspec" },
  { "p00f/clangd_extensions.nvim" },
  { "rcarriga/nvim-dap-ui" },
  { "roobert/tailwindcss-colorizer-cmp.nvim" },
  { "rouge8/neotest-rust" },
  { "simrat39/rust-tools.nvim" },
  { "suketa/nvim-dap-ruby" },
  { "theHamsta/nvim-dap-virtual-text" },
  { "zbirenbaum/copilot-cmp" },
  { "zbirenbaum/copilot.lua" },
}
