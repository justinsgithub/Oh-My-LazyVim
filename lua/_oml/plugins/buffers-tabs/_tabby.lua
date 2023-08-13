vim.o.showtabline = 2
-- WARN: need to really configure to get operating decently
return {
  "nanozuki/tabby.nvim",
  enabled = false,
  config = function()
    -- EXAMPLE 2
    -- local theme = {
    --   fill = "TabLineFill",
    --   -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
    --   head = "TabLine",
    --   current_tab = "TabLineSel",
    --   tab = "TabLine",
    --   win = "TabLine",
    --   tail = "TabLine",
    -- }
    -- require("tabby.tabline").set(function(line)
    --   return {
    --     {
    --       { "  ", hl = theme.head },
    --       line.sep("", theme.head, theme.fill),
    --     },
    --     line.tabs().foreach(function(tab)
    --       local hl = tab.is_current() and theme.current_tab or theme.tab
    --       return {
    --         line.sep("", hl, theme.fill),
    --         tab.is_current() and "" or "󰆣",
    --         tab.number(),
    --         tab.name(),
    --         tab.close_btn(""),
    --         line.sep("", hl, theme.fill),
    --         hl = hl,
    --         margin = " ",
    --       }
    --     end),
    --     line.spacer(),
    --     line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
    --       return {
    --         line.sep("", theme.win, theme.fill),
    --         win.is_current() and "" or "",
    --         win.buf_name(),
    --         line.sep("", theme.win, theme.fill),
    --         hl = theme.win,
    --         margin = " ",
    --       }
    --     end),
    --     {
    --       line.sep("", theme.tail, theme.fill),
    --       { "  ", hl = theme.tail },
    --     },
    --     hl = theme.fill,
    --   }
    -- end)
    -- EXAMPLE 2
    --   require("tabby.tabline").use_preset("active_wins_at_tail", {
    --     theme = {
    --       fill = "TabLineFill", -- tabline background
    --       head = "TabLine", -- head element highlight
    --       current_tab = "TabLineSel", -- current tab label highlight
    --       tab = "TabLine", -- other tab label highlight
    --       win = "TabLine", -- window highlight
    --       tail = "TabLine", -- tail element highlight
    --     },
    --     nerdfont = true, -- whether use nerdfont
    --     tab_name = {
    --       name_fallback = function(tabid)
    --         return "tabname"
    --       end, --"function({tabid}), return a string",
    --     },
    --     buf_name = {
    --       mode = "'unique'|'relative'|'tail'|'shorten'",
    --     },
    --   })
    --   EXAMPLE 3
    local function tab_name(tab)
      return string.gsub(tab, "%[..%]", "")
    end

    local function tab_modified(tab)
      local wins = require("tabby.module.api").get_tab_wins(tab)
      for i, x in pairs(wins) do
        if vim.bo[vim.api.nvim_win_get_buf(x)].modified then
          return ""
        end
      end
      return ""
    end

    local function lsp_diag(buf)
      local diagnostics = vim.diagnostic.get(buf)
      local count = { 0, 0, 0, 0 }

      for _, diagnostic in ipairs(diagnostics) do
        count[diagnostic.severity] = count[diagnostic.severity] + 1
      end
      if count[1] > 0 then
        return vim.bo[buf].modified and "" or ""
      elseif count[2] > 0 then
        return vim.bo[buf].modified and "" or ""
      end
      return vim.bo[buf].modified and "" or ""
    end

    local function get_modified(buf)
      if vim.bo[buf].modified then
        return ""
      else
        return ""
      end
    end

    local function buffer_name(buf)
      if string.find(buf, "NvimTree") then
        return "NvimTree"
      end
      return buf
    end

    local theme = {
      fill = { fg = "#f2e9de", bg = "#907aa9", style = "italic" }, -- "TabFill",
      -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' },
      head = { fg = "#f2e9de", bg = "#907aa9", style = "italic" }, -- "TabLineHead",
      current_tab = { fg = "#f2e9de", bg = "#907aa9", style = "italic" }, -- "TabLineSel",
      inactive_tab = { fg = "#f2e9de", bg = "#907aa9", style = "italic" }, -- "TabLineIn",
      tab = { fg = "#f2e9de", bg = "#907aa9", style = "italic" }, -- "TabLine",
      win = { fg = "#f2e9de", bg = "#907aa9", style = "italic" }, -- "TabLineHead",
      tail = { fg = "#f2e9de", bg = "#907aa9", style = "italic" }, -- "TabLineHead",
    }
    require("tabby.tabline").set(function(line)
      return {
        {
          { "  ", hl = theme.head },
          line.sep("", theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.inactive_tab
          return {
            line.sep("", hl, theme.fill),
            tab.number(),
            "",
            tab_name(tab.name()),
            "",
            tab_modified(tab.id),
            line.sep("", hl, theme.fill),
            hl = hl,
            margin = " ",
          }
        end),
        line.spacer(),
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
          local hl = win.is_current() and theme.current_tab or theme.inactive_tab
          return {
            line.sep("", hl, theme.fill),
            win.file_icon(),
            "",
            buffer_name(win.buf_name()),
            "",
            lsp_diag(win.buf().id),
            line.sep("", hl, theme.fill),
            hl = hl,
            margin = " ",
          }
        end),
        {
          line.sep("", theme.tail, theme.fill),
          { "  ", hl = theme.tail },
        },
        hl = theme.fill,
      }
    end)
  end,
}
