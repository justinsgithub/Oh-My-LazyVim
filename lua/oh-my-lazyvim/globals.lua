CONFIGDIR = vim.api.nvim_eval("stdpath('config')")

BEST_DISTRO = "ARCH"

-- protected map, will not override keys set in active plugin spec, (stolen from LunarVim)
JOINPATHS = function(...)
  local result = table.concat({ ... }, "/")
  return result
end

SNIPSDIR = JOINPATHS(CONFIGDIR, "snippets")

PrintTable = function(tbl)
  print(vim.inspect(tbl))
  return tbl
end

-- just adds default options to get ride of some repetitiveness
MAP = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- protected map, will not override keys set in active plugin spec, (stolen from LazyVim)
PMAP = function(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

--    --// exportstring( string )
--    --// returns a "Lua" portable version of the string
local function exportstring(s)
  return string.format("%q", s)
end

-- CAREFUL WITH LARGE TABLES, UNSAFE FUNCTION
SaveTable = function(tbl, filename)
  local charS, charE = "   ", "\n"
  local file, err = io.open(filename, "wb")
  if err then
    return err
  end

  -- initiate variables for save procedure
  local tables, lookup = { tbl }, { [tbl] = 1 }
  file:write("return {" .. charE)

  for idx, t in ipairs(tables) do
    file:write("-- Table: {" .. idx .. "}" .. charE)
    file:write("{" .. charE)
    local thandled = {}

    for i, v in ipairs(t) do
      thandled[i] = true
      local stype = type(v)
      -- only handle value
      if stype == "table" then
        if not lookup[v] then
          table.insert(tables, v)
          lookup[v] = #tables
        end
        file:write(charS .. "{" .. lookup[v] .. "}," .. charE)
      elseif stype == "string" then
        file:write(charS .. exportstring(v) .. "," .. charE)
      elseif stype == "number" then
        file:write(charS .. tostring(v) .. "," .. charE)
      end
    end

    for i, v in pairs(t) do
      -- escape handled values
      if not thandled[i] then
        local str = ""
        local stype = type(i)
        -- handle index
        if stype == "table" then
          if not lookup[i] then
            table.insert(tables, i)
            lookup[i] = #tables
          end
          str = charS .. "[{" .. lookup[i] .. "}]="
        elseif stype == "string" then
          str = charS .. "[" .. exportstring(i) .. "]="
        elseif stype == "number" then
          str = charS .. "[" .. tostring(i) .. "]="
        end

        if str ~= "" then
          stype = type(v)
          -- handle value
          if stype == "table" then
            if not lookup[v] then
              table.insert(tables, v)
              lookup[v] = #tables
            end
            file:write(str .. "{" .. lookup[v] .. "}," .. charE)
          elseif stype == "string" then
            file:write(str .. exportstring(v) .. "," .. charE)
          elseif stype == "number" then
            file:write(str .. tostring(v) .. "," .. charE)
          end
        end
      end
    end
    file:write("}," .. charE)
  end
  file:write("}")
  file:close()
end

-- quickly write table to temporary file
TempTable = function(tbl)
  SaveTable(tbl, "_tmptable.lua")
end

--// The Load Function
LoadTable = function(sfile)
  local ftables, err = loadfile(sfile)
  if err then
    return _, err
  end
  local tables = ftables()
  for idx = 1, #tables do
    local tolinki = {}
    for i, v in pairs(tables[idx]) do
      if type(v) == "table" then
        tables[idx][i] = tables[v[1]]
      end
      if type(i) == "table" and tables[i[1]] then
        table.insert(tolinki, { i, tables[i[1]] })
      end
    end
    -- link indices
    for _, v in ipairs(tolinki) do
      tables[idx][v[2]], tables[idx][v[1]] = tables[idx][v[1]], nil
    end
  end
  return tables[1]
end

Reload = function(...)
  return require("plenary.reload").reload_module(...)
end

ReRequire = function(name)
  Reload(name)
  return require(name)
end
