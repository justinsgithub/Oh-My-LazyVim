return {
  {
    "ellisonleao/carbon-now.nvim",
    opts = {
      base_url = "https://carbon.now.sh/",
      open_cmd = "xdg-open",
      options = {
        theme = "monokai",
        window_theme = "none",
        font_family = "Hack",
        font_size = "18px",
        bg = "gray",
        line_numbers = true,
        line_height = "133%",
        drop_shadow = false,
        drop_shadow_offset_y = "20px",
        drop_shadow_blur = "68px",
        width = "680",
        watermark = false,
      },
    },
    cmd = "CarbonNow",
  },
  {
    "kevinhwang91/nvim-bqf",
  },
  {
    "nacro90/numb.nvim",
  },
  {
    "monaqa/dial.nvim",
  },
  {
    "ThePrimeagen/vim-be-good",
  },
  {
    -- http rest client
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    opts = {
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        -- show the generated curl command in case you want to launch
        -- the same request via the terminal (can be verbose)
        show_curl_command = false,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
          end,
        },
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = ".env",
      custom_dynamic_variables = {},
      yank_dry_run = true,
    },
  },
  {
    "norcalli/nvim-colorizer.lua", -- highlight colors #fff #ffa #a9423f
    opts = {
      ["*"] = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      },
    },
  },
}
