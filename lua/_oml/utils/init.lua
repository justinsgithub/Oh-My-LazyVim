local M = {}

M.augroup = function(name) -- oml for Oh My Lazyvim
  return vim.api.nvim_create_augroup("oml_" .. name, { clear = true })
end

M.runtime_paths_to_file = function()
  local rtps = vim.api.nvim_list_runtime_paths()
  M.table_to_tmp_file(rtps)
  return rtps
end

M.config_dir = vim.api.nvim_eval("stdpath('config')")

-- stolen from LunarVim
M.join_paths = function(...)
  local result = table.concat({ ... }, "/")
  return result
end

M.skeleton_dir = M.join_paths(M.config_dir, "skeletons")

M.lua_dir = M.join_paths(M.config_dir, "lua")

M.plugins_dir = M.join_paths(M.lua_dir, "plugins")

-- Get the filenames and require them
M.require_plugin_files = function(plugin_type)
  local dir = M.join_paths(M.plugins_dir, plugin_type)
  local pattern = dir .. "/_*.lua"
  local paths = vim.split(vim.fn.glob(pattern), "\n")
  local table_of_specs = {}
  for _, path in ipairs(paths) do
    local path_split = vim.fn.split(path, "/") --path is a string path_split is a table
    local file = string.gsub(path_split[#path_split], "%.lua?$", "") -- trim off .lua\n
    table_of_specs[#table_of_specs + 1] = require("plugins." .. plugin_type .. "." .. file)
  end
  return table_of_specs
end

M.print_table = function(tbl)
  print(vim.inspect(tbl))
  return tbl
end

-- protected map, will not override keys set in active plugin spec, (from LazyVim internals)
M.keymap = function(mode, lhs, rhs, opts)
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
M.table_to_file = function(tbl, filename)
  local charS, charE = "   ", "\n"
  local file, err = io.open(filename, "wb")
  if err then
    return err
  end

  if file == nil then
    return
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
M.table_to_tmp_file = function(tbl)
  M.table_to_file(tbl, "_tmptable.lua")
end

--// The Load Function, loads a lua table from a file, table must be correct lua syntax or will err
M.table_from_file = function(sfile)
  local ftables, err = loadfile(sfile)
  if err then
    return _, err
  end

  if ftables == nil then
    return nil
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

M.reload_module = function(...)
  return require("plenary.reload").reload_module(...)
end

M.rerequire_module = function(name)
  M.reload_module(name)
  return require(name)
end

return M
