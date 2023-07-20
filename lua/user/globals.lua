local utils = require("oh-my-lazyvim.utils")

GetRuntimePaths = utils.runtime_paths_to_file

CONFIGDIR = utils.config_dir

-- protected map, will not override keys set in active plugin spec, (stolen from LunarVim)
JOINPATHS = utils.join_paths

SNIPSDIR = utils.snippets_dir

PrintTable = utils.print_table

-- just adds default options to get ride of some repetitiveness
MAP = utils.keymap

-- protected map, will not override keys set in active plugin spec, (stolen from LazyVim)
PMAP = utils.p_keymap

-- CAREFUL WITH LARGE TABLES, UNSAFE FUNCTION
TableToFile = utils.table_to_file

-- quickly write table to temporary file
TempTable = utils.table_to_tmp_file

--// The Load Function, loads a lua table from a file, table must be correct lua syntax or will err
LoadTable = utils.table_from_file

Reload = utils.reload_module

ReRequire = utils.rerequire_module
