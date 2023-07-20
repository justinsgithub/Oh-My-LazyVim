-- add any tools you want to have installed below
-- add any tools you want to have installed below
return
-- add any tools you want to have installed below
{
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "marksman",
      "flake8",
    },
    automatic_installation = true,
  },
}
