-- TODO: ? this gets everything working with <leader>j{keys}, might want to make whichkey descriptions shorter
vim.cmd([[
"Basic jukit options
let g:jukit_shell_cmd = 'ipython3'
"    - Specifies the command used to start a shell in the output split. Can also be an absolute path. Can also be any other shell command, e.g. `R`, `julia`, etc. (note that output saving is only possible for ipython)
let g:jukit_terminal = ''
"   - Terminal to use. Can be one of '', 'kitty', 'vimterm', 'nvimterm' or 'tmux'. If '' is given then will try to detect terminal (though this might fail, in which case it simply defaults to 'vimterm' or 'nvimterm' - depending on the output of `has("nvim")`)
let g:jukit_auto_output_hist = 0
"   - If set to 1, will create an autocmd with event `CursorHold` to show saved ipython output of current cell in output-history split. Might slow down (n)vim significantly, you can use `set updatetime=<number of milliseconds>` to control the time to wait until CursorHold events are triggered, which might improve performance if set to a higher number (e.g. `set updatetime=1000`).
let g:jukit_use_tcomment = 0
"   - Whether to use tcomment plugin (https://github.com/tomtom/tcomment_vim) to comment out cell markers. If not, then cell markers will simply be prepended with `g:jukit_comment_mark`
let g:jukit_comment_mark = '#'
"   - See description of `g:jukit_use_tcomment` above
let g:jukit_mappings = 0
"   - If set to 0, none of the default function mappings (as specified further down) will be applied
let g:jukit_mappings_ext_enabled = "*"
"   - String or list of strings specifying extensions for which the mappings will be created. For example, `let g:jukit_mappings_ext_enabled=['py', 'ipynb']` will enable the mappings only in `.py` and `.ipynb` files. Use `let g:jukit_mappings_ext_enabled='*'` to enable them for all files.
let g:jukit_notebook_viewer = 'jupyter-notebook'
"   - Command to open .ipynb files, by default jupyter-notebook is used. To use e.g. vs code instead, you could set this to `let g:jukit_notebook_viewer = 'code'`
let g:jukit_convert_overwrite_default = -1
"   - Default setting when converting from .ipynb to .py or vice versa and a file of the same name already exists. Can be of [-1, 0, 1], where -1 means no default (i.e. you'll be prompted to specify what to do), 0 means never overwrite, 1 means always overwrite
let g:jukit_convert_open_default = -1
"   - Default setting for whether the notebook should be opened after converting from .py to .ipynb. Can be of [-1, 0, 1], where -1 means no default (i.e. you'll be prompted to specify what to do), 0 means never open, 1 means always open
let g:jukit_file_encodings = 'utf-8'
"   - Default encoding for reading and writing to files in the python helper functions
let g:jukit_venv_in_output_hist = 1
"   - Whether to also use the provided terminal command for the output history split when starting the splits using the JukitOUtHist command. If 0, the provided terminal command is only used in the output split, not in the output history split.

" Cell highlighting/syntax
let g:jukit_highlight_markers = 1
"    - Whether to highlight cell markers or not. You can specify the colors of cell markers by putting e.g. `highlight jukit_cellmarker_colors guifg=#1d615a guibg=#1d615a ctermbg=22 ctermfg=22` with your desired colors in your (neo)vim config. Make sure to define this highlight *after* loading a colorscheme in your (neo)vim config
let g:jukit_enable_textcell_bg_hl = 1
"    - Whether to highlight background of textcells. You can specify the color by putting `highlight jukit_textcell_bg_colors guibg=#131628 ctermbg=0` with your desired colors in your (neo)vim config. Make sure to define this highlight group *after* loading a colorscheme in your (neo)vim config.
let g:jukit_enable_textcell_syntax = 1
"    - Whether to enable markdown syntax highlighting in textcells
let g:jukit_text_syntax_file = $VIMRUNTIME . '/syntax/' . 'markdown.vim'
"    - Syntax file to use for textcells. If you want to define your own syntax matches inside of text cells, make sure to include `containedin=textcell`.
let g:jukit_hl_ext_enabled = '*'
"    - String or list of strings specifying extensions for which the relevant highlighting autocmds regarding marker-highlighting, textcell-highlighting, etc. will be created. For example, `let g:jukit_hl_extensions=['py', 'R']` will enable the defined highlighting options for `.py` and `.R` files. Use `let g:jukit_hl_extensions='*'` to enable them for all files and `let g:jukit_hl_extensions=''` to disable them completely

"kitty
" let g:jukit_output_bg_color = get(g:, 'jukit_output_bg_color', '')
"    - Optional custom background color of output split window (i.e. target window of sent code)
" let g:jukit_output_fg_color = get(g:, 'jukit_output_fg_color', '')
"    - Optional custom foreground color of output split window (i.e. target window of sent code)
" let g:jukit_outhist_bg_color = get(g:, 'jukit_outhist_bg_color', '#090b1a')
"    - Optional custom background color of output-history window
" let g:jukit_outhist_fg_color = get(g:, 'jukit_outhist_fg_color', 'gray')
"    - Optional custom foreground color of output-history window
" let g:jukit_output_new_os_window = 0
"    - If set to 1, opens output split in new os-window. Can be used to e.g. write code in one kitty-os-window on your primary monitor while sending code to the shell which is in a seperate kitty-os-window on another monitor.
" let g:jukit_outhist_new_os_window = 0
"    - Same as `g:jukit_output_new_os_window`, only for output-history-split

" Matplotlib
let g:jukit_savefig_dpi = 150
"    - Value for `dpi` argument for matplotlibs `savefig` function
let g:jukit_mpl_block = 1
"    - If set to 0, then `plt.show()` will by default be executed as if `plt.show(block=False)` was specified
let g:jukit_custom_backend = -1
"    - Custom matplotlib backend to use

" IF KITTY IS USED:
" let g:jukit_mpl_style = jukit#util#plugin_path() . '/helpers/matplotlib-backend-kitty/backend.mplstyle'
"    - File specifying matplotlib plot options. This is the default value if kitty terminal is used
" ELSE:
let g:jukit_mpl_style = ''
"    - File specifying matplotlib plot options. This is the default value if kitty terminal is NOT used. If '' is specified, no custom mpl-style is applied.

" IF KITTY OR TMUX IS USED:
" let g:jukit_inline_plotting = 1
"    - Enable in-terminal-plotting. Only supported for kitty or tmux+iTerm2 -> BE SURE TO SPECIFY THE TERMINAL VIA `g:jukit_terminal`! (see variables in section 'Basic jukit options')
" ELSE:
let g:jukit_inline_plotting = 0
"    - Disable in-terminal-plotting

"Split layout
" You can define a custom split layout as a dictionary, the default is:
let g:jukit_layout = {
    \'split': 'horizontal',
    \'p1': 0.6, 
    \'val': [
        \'file_content',
        \{
            \'split': 'vertical',
            \'p1': 0.6,
            \'val': ['output', 'output_history']
        \}
    \]
\}

" this results in the following split layout:
"  ______________________________________
" |                      |               |
" |                      |               |
" |                      |               |
" |                      |               |
" |                      |     output    |
" |                      |               |
" |                      |               |
" |    file_content      |               |
" |                      |_______________|
" |                      |               |
" |                      |               |
" |                      | output_history|
" |                      |               |
" |                      |               |
" |______________________|_______________|
"
" The positions of all 3 split windows must be defined in the dictionary, even if 
" you don't plan on using the output_history split.
"
" dictionary keys:
" 'split':  Split direction of the two splits specified in 'val'. Either 'horizontal' or 'vertical'
" 'p1':     Proportion of the first split specified in 'val'. Value must be a float with 0 < p1 < 1
" 'val':    A list of length 2 which specifies the two splits for which to apply the above two options.
"           One of the two items in the list must be a string and one must be a dictionary in case of
"           the 'outer' dictionary, while the two items in the list must both be strings in case of
"           the 'inner' dictionary.
"           The 3 strings must be different and can be one of: 'file_content', 'output', 'output_history'
"
" To not use any layout, specify `let g:jukit_layout=-1`

"Überzug

" let g:jukit_hist_use_ueberzug = 0
"   - Set to 1 to use Überzug to display saved outputs instead of an ipython split window
" let g:jukit_ueberzug_use_cached = 1
"   - Whether to cache created images of saved outputs. If set to 0, will convert saved outputs to png from scratch each time. Note that this will make displaying saved outputs significantly slower. 
" let g:jukit_ueberzug_pos = [0.25, 0.25, 0.4, 0.6]
"   - position and dimension of Überzug window WITH output split present - [x, y, width, height]. Use `:call jukit#ueberzug#set_default_pos()` to modify/visualize.
" let g:jukit_ueberzug_pos_noout = [0.25, 0.25, 0.4, 0.6]
"   - position and dimension of Überzug window WITHOUT output split present - [x, y, width, height]. Use `:call jukit#ueberzug#set_default_pos()` to modify/visualize.
" let g:jukit_kill_ueberzug_on_focus_lost = 1
"   - whether to kill ueberzug when the focus to neovim is lost (detecting focus might only work on neovim). if set to 0, the ueberzug image keeps being displayed even when neovim loses focus (e.g. when switching tabs in terminal).

" let g:jukit_ueberzug_border_color = get(g:, 'jukit_ueberzug_border_color', 'blue')
"   - border color of Überzug images
" let g:jukit_ueberzug_theme = 'dark'
"   - choose dark or light theme for markdown cells
" let g:jukit_ueberzug_term_hw_ratio = -1
"   - this is relevant in case the shown ueberzug image is cut off horizontally. In that case, the determined width/height ratio of your terminal cells is determined incorrectly. A value of -1 means the ratio should be determined automatically. A ratio of 2.2 is used by default if the ratio can't be determined automatically. If you get a cut off image, try setting this parameter and vary the values around 2.0 (e.g. `let g:jukit_ueberzug_term_hw_ratio = 2.3` or `let g:jukit_ueberzug_term_hw_ratio = 1.9`) until the image is displayed correctly to determine your needed ratio.
" let g:jukit_ueberzug_python_cmd = 'python3'
"   - path to python3 executable for which the überzug requirements (beautifulsoup4, pillow, ueberzug) are installed. By default it just uses the python3 command found in your environment. If you started an output split in a virtual environment, make sure that you either have all the requirements in the virtual requirements or set the absolute path to the python3 command.
" let g:jukit_ueberzug_jupyter_cmd = 'jupyter'
"   - path to jupyter executable. By default it just uses the jupyter command found in your environment. If you started an output split in a virtual environment, make sure that you either have jupyter installed in that environment or set the absolute path to the python3 command.
" let g:jukit_ueberzug_cutycapt_cmd = 'cutycapt'
"   - path to cutycapt executable
" let g:jukit_ueberzug_imagemagick_cmd = 'convert'
"   - path to imagemagick (`convert` command) executable

"INFO: commented out because set in config = function (below)
"Functions and default mappings

"Splits
" nnoremap <leader>jos :call jukit#splits#output()<cr>
"   - Opens a new output window and executes the command specified in `g:jukit_shell_cmd`
" nnoremap <leader>jts :call jukit#splits#term()<cr>
"   - Opens a new output window without executing any command
" nnoremap <leader>jhs :call jukit#splits#history()<cr>
"   - Opens a new output-history window, where saved ipython outputs are displayed
" nnoremap <leader>johs :call jukit#splits#output_and_history()<cr>
"   - Shortcut for opening output terminal and output-history
" nnoremap <leader>jhd :call jukit#splits#close_history()<cr>
"   - Close output-history window
" nnoremap <leader>jod :call jukit#splits#close_output_split()<cr>
"   - Close output window
" nnoremap <leader>johd :call jukit#splits#close_output_and_history(1)<cr>
"   - Close both windows. Argument: Whether or not to ask you to confirm before closing.
" nnoremap <leader>jso :call jukit#splits#show_last_cell_output(1)<cr>
"   - Show output of current cell (determined by current cursor position) in output-history window. Argument: Whether or not to reload outputs if cell id of outputs to display is the same as the last cell id for which outputs were displayed
" nnoremap <leader>jj :call jukit#splits#out_hist_scroll(1)<cr>
"   - Scroll down in output-history window. Argument: whether to scroll down (1) or up (0)
" nnoremap <leader>jk :call jukit#splits#out_hist_scroll(0)<cr>
"   - Scroll up in output-history window. Argument: whether to scroll down (1) or up (0)
" nnoremap <leader>jah :call jukit#splits#toggle_auto_hist()<cr>
"   - Create/delete autocmd for displaying saved output on CursorHold. Also, see explanation for `g:jukit_auto_output_hist`
" nnoremap <leader>jsl :call jukit#layouts#set_layout()<cr>
"   - Apply layout (see `g:jukit_layout`) to current splits - NOTE: it is expected that this function is called from the main file buffer/split

"Sending code
" nnoremap <leader>j<space> :call jukit#send#section(0)<cr>
"   - Send code within the current cell to output split (also saves the output if ipython is used and `g:jukit_save_output==1`). Argument: if 1, will move the cursor to the next cell below after sending the code to the split, otherwise cursor position stays the same.
" nnoremap <leader>jsl :call jukit#send#line()<cr>
"   - Send current line to output split
" vnoremap <leader>jss :<C-U>call jukit#send#selection()<cr>
"   - Send visually selected code to output split
" nnoremap <leader>jcc :call jukit#send#until_current_section()<cr>
"   - Execute all cells until the current cell
" nnoremap <leader>jall :call jukit#send#all()<cr>
"   - Execute all cells

"Cells
" nnoremap <leader>jco :call jukit#cells#create_below(0)<cr>
"   - Create new code cell below. Argument: Whether to create code cell (0) or markdown cell (1)
" nnoremap <leader>jcO :call jukit#cells#create_above(0)<cr>
"   - Create new code cell above. Argument: Whether to create code cell (0) or markdown cell (1)
" nnoremap <leader>jct :call jukit#cells#create_below(1)<cr>
"   - Create new textcell below. Argument: Whether to create code cell (0) or markdown cell (1)
" nnoremap <leader>jcT :call jukit#cells#create_above(1)<cr>
"   - Create new textcell above. Argument: Whether to create code cell (0) or markdown cell (1)
" nnoremap <leader>jcd :call jukit#cells#delete()<cr>
"   - Delete current cell
" nnoremap <leader>jcs :call jukit#cells#split()<cr>
"   - Split current cell (saved output will then be assigned to the resulting cell above)
" nnoremap <leader>jcM :call jukit#cells#merge_above()<cr>
"   - Merge current cell with the cell above
" nnoremap <leader>jcm :call jukit#cells#merge_below()<cr>
"   - Merge current cell with the cell below
" nnoremap <leader>jck :call jukit#cells#move_up()<cr>
"   - Move current cell up
" nnoremap <leader>jcj :call jukit#cells#move_down()<cr>
"   - Move current cell down
" nnoremap <leader>jJ :call jukit#cells#jump_to_next_cell()<cr>
"   - Jump to the next cell below
" nnoremap <leader>jK :call jukit#cells#jump_to_previous_cell()<cr>
"   - Jump to the previous cell above
" nnoremap <leader>jddo :call jukit#cells#delete_outputs(0)<cr>
"   - Delete saved output of current cell. Argument: Whether to delete all saved outputs (1) or only saved output of current cell (0)
" nnoremap <leader>jdda :call jukit#cells#delete_outputs(1)<cr>
"   - Delete saved outputs of all cells. Argument: Whether to delete all saved outputs (1) or only saved output of current cell (0)

"ipynb conversion
" nnoremap <leader>jnp :call jukit#convert#notebook_convert("jupyter-notebook")<cr>
" -- Convert from ipynb to py or vice versa. Argument: Optional. If an argument is specified, then its value is used to open the resulting ipynb file after converting script.
" nnoremap <leader>jht :call jukit#convert#save_nb_to_file(0,1,'html')<cr>
"   - Convert file to html (including all saved outputs) and open it using the command specified in `g:jukit_html_viewer'. If `g:jukit_html_viewer` is not defined, then will default to `g:jukit_html_viewer='xdg-open'`. Arguments: 1.: Whether to rerun all cells when converting 2.: Whether to open it after converting 3.: filetype to convert to 
" nnoremap <leader>jrht :call jukit#convert#save_nb_to_file(1,1,'html')<cr>
"   - same as above, but will (re-)run all cells when converting to html
" nnoremap <leader>jpd :call jukit#convert#save_nb_to_file(0,1,'pdf')<cr>
"   - Convert file to pdf (including all saved outputs) and open it using the command specified in `g:jukit_pdf_viewer'. If `g:jukit_pdf_viewer` is not defined, then will default to `g:jukit_pdf_viewer='xdg-open'`. Arguments: 1.: Whether to rerun all cells when converting 2.: Whether to open it after converting 3.: filetype to convert to. NOTE: If the function doesn't work there may be issues with your nbconvert or latex version - to debug, try converting to pdf using `jupyter nbconvert --to pdf --allow-errors --log-level='ERROR' --HTMLExporter.theme=dark </abs/path/to/ipynb> && xdg-open </abs/path/to/pdf>` in your terminal and check the output for possible issues.
" nnoremap <leader>jrpd :call jukit#convert#save_nb_to_file(1,1,'pdf')<cr>
"   - same as above, but will (re-)run all cells when converting to pdf. NOTE: If the function doesn't work there may be issues with your nbconvert or latex version - to debug, try converting to pdf using `jupyter nbconvert --to pdf --allow-errors --log-level='ERROR' --HTMLExporter.theme=dark </abs/path/to/ipynb> && xdg-open </abs/path/to/pdf>` in your terminal and check the output for possible issues.

"Ueberzug
" nnoremap <leader>pos :call jukit#ueberzug#set_default_pos()<cr>
"   - set position and dimension of überzug window

"Commands
" :JukitOut some command to be run before opening shell
" :JukitOutHist some command to be run before opening shell

" When working in a virtual environment, you can activate it before running the shell command using the JukitOut or JukitOutHist command, for example:
" :JukitOut conda activate MyCondaEnv

" Creating your own convenience functions

fun! DFColumns()
    let visual_selection = jukit#util#get_visual_selection()
    let cmd = visual_selection . '.columns'
    call jukit#send#send_to_split(cmd)
endfun

" vnoremap <leader>jc :call DFColumns()<cr>

fun! PythonHelp()
    let visual_selection = jukit#util#get_visual_selection()
    let cmd = 'help(' . visual_selection . ')'
    call jukit#send#send_to_split(cmd)
endfun

" vnoremap <leader>jh :call PythonHelp()<cr>
]])

return {
  "luk400/vim-jukit",
  enabled = true,
  config = function()
    -- TODO: ? does not work with whichkey correctly, setting keymaps permanantly for now
    -- vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
    --   pattern = { "markdown", "python", "*.ipynb", "r", "julia", "matlab", "java", "rust", "lua" },
    -- callback = function()

    local map = require("_oml.utils").keymap
    map(

      "n",
      "<leader>pos",
      "<cmd>:call jukit#ueberzug#set_default_pos()<cr>",
      { desc = "set position and dimension of überzug window" }
    )
    map("n", "<leader>jrpd", "<cmd>:call jukit#convert#save_nb_to_file(1,1,'pdf')<cr>", {
      desc = "convert ot pdf will (re-)run all cells when converting to pdf. NOTE: If the function doesn't work there may be issues with your nbconvert or latex version - to debug, try converting to pdf using `jupyter nbconvert --to pdf --allow-errors --log-level='ERROR' --HTMLExporter.theme=dark </abs/path/to/ipynb> && xdg-open </abs/path/to/pdf>` in your terminal and check the output for possible issues.",
    })
    map("n", "<leader>jpd", "<cmd>:call jukit#convert#save_nb_to_file(0,1,'pdf')<cr>", {
      desc = "Convert file to pdf (including all saved outputs) and open it using the command specified in `g:jukit_pdf_viewer'. If `g:jukit_pdf_viewer` is not defined, then will default to `g:jukit_pdf_viewer='xdg-open'`. Arguments: 1.: Whether to rerun all cells when converting 2.: Whether to open it after converting 3.: filetype to convert to. NOTE: If the function doesn't work there may be issues with your nbconvert or latex version - to debug, try converting to pdf using `jupyter nbconvert --to pdf --allow-errors --log-level='ERROR' --HTMLExporter.theme=dark </abs/path/to/ipynb> && xdg-open </abs/path/to/pdf>` in your terminal and check the output for possible issues.",
    })
    map(

      "n",
      "<leader>jrht",
      "<cmd>:call jukit#convert#save_nb_to_file(1,1,'html')<cr>",
      { desc = "same as above, but will (re-)run all cells when converting to html" }
    )
    map("n", "<leader>jht", "<cmd>:call jukit#convert#save_nb_to_file(0,1,'html')<cr>", {
      desc = "Convert file to html (including all saved outputs) and open it using the command specified in `g:jukit_html_viewer'. If `g:jukit_html_viewer` is not defined, then will default to `g:jukit_html_viewer='xdg-open'`. Arguments: 1.: Whether to rerun all cells when converting 2.: Whether to open it after converting 3.: filetype to convert to ",
    })
    map("n", "<leader>jnp", "<cmd>:call jukit#convert#notebook_convert('jupyter-notebook')<cr>", {
      desc = "Convert from ipynb to py or vice versa. Argument: Optional. If an argument is specified, then its value is used to open the resulting ipynb file after converting script.",
    })
    map("n", "<leader>jdda", "<cmd>:call jukit#cells#delete_outputs(1)<cr>", {
      desc = "Delete saved outputs of all cells. Argument: Whether to delete all saved outputs (1) or only saved output of current cell (0)",
    })
    map("n", "<leader>jddo", "<cmd>:call jukit#cells#delete_outputs(0)<cr>", {
      desc = "Delete saved output of current cell. Argument: Whether to delete all saved outputs (1) or only saved output of current cell (0)",
    })
    map(

      "n",
      "<leader>jK",
      "<cmd>:call jukit#cells#jump_to_previous_cell()<cr>",
      { desc = "Jump to the previous cell above" }
    )
    map("n", "<leader>jJ", "<cmd>:call jukit#cells#jump_to_next_cell()<cr>", { desc = "Jump to the next cell below" })
    map("n", "<leader>jcj", "<cmd>:call jukit#cells#move_down()<cr>", { desc = "Move current cell down" })
    map("n", "<leader>jck", "<cmd>:call jukit#cells#move_up()<cr>", { desc = "Move current cell up" })
    map(
      "n",
      "<leader>jcm",
      "<cmd>:call jukit#cells#merge_below()<cr>",
      { desc = "Merge current cell with the cell below" }
    )
    map(
      "n",
      "<leader>jcM",
      "<cmd>:call jukit#cells#merge_above()<cr>",
      { desc = "Merge current cell with the cell above" }
    )
    map(

      "n",
      "<leader>jcs",
      "<cmd>:call jukit#cells#split()<cr>",
      { desc = "Split current cell (saved output will then be assigned to the resulting cell above)" }
    )
    map("n", "<leader>jcd", "<cmd>:call jukit#cells#delete()<cr>", { desc = "Delete current cell" })
    map(

      "n",
      "<leader>jcT",
      "<cmd>:call jukit#cells#create_above(1)<cr>",
      { desc = "Create new textcell above. Argument: Whether to create code cell (0) or markdown cell (1)" }
    )
    map(

      "n",
      "<leader>jct",
      "<cmd>:call jukit#cells#create_below(1)<cr>",
      { desc = "Create new textcell below. Argument: Whether to create code cell (0) or markdown cell (1)" }
    )
    map(

      "n",
      "<leader>jcO",
      "<cmd>:call jukit#cells#create_above(0)<cr>",
      { desc = "Create new code cell above. Argument: Whether to create code cell (0) or markdown cell (1)" }
    )
    map(

      "n",
      "<leader>jco",
      "<cmd>:call jukit#cells#create_below(0)<cr>",
      { desc = "Create new code cell below. Argument: Whether to create code cell (0) or markdown cell (1)" }
    )
    map("n", "<leader>jall", "<cmd>:call jukit#send#all()<cr>", { desc = "Execute all cells" })
    map(

      "n",
      "<leader>jcc",
      "<cmd>:call jukit#send#until_current_section()<cr>",
      { desc = "Execute all cells until the current cell" }
    )
    map(

      "n",
      "<leader>jss",
      "<cmd>:<C-U>call jukit#send#selection()<cr>",
      { desc = "Send visually selected code to output split" }
    )
    map("n", "<leader>jsl", "<cmd>:call jukit#send#line()<cr>", { desc = "Send current line to output split" })
    map("n", "<leader>j<space>", "<cmd>:call jukit#send#section(0)<cr>", {
      desc = "Send code within the current cell to output split (also saves the output if ipython is used and `g:jukit_save_output==1`). Argument: if 1, will move the cursor to the next cell below after sending the code to the split, otherwise cursor position stays the same.",
    })
    map("n", "<leader>jsl", "<cmd>:call jukit#layouts#set_layout()<cr>", {
      desc = "Apply layout (see `g:jukit_layout`) to current splits - NOTE: it is expected that this function is called from the main file buffer/split",
    })
    map("n", "<leader>jah", "<cmd>:call jukit#splits#toggle_auto_hist()<cr>", {
      desc = "Create/delete autocmd for displaying saved output on CursorHold. Also, see explanation for `g:jukit_auto_output_hist`",
    })
    map(

      "n",
      "<leader>jk",
      "<cmd>:call jukit#splits#out_hist_scroll(0)<cr>",
      { desc = "Scroll up in output-history window. Argument: whether to scroll down (1) or up (0)" }
    )
    map(

      "n",
      "<leader>jj",
      "<cmd>:call jukit#splits#out_hist_scroll(1)<cr>",
      { desc = "Scroll down in output-history window. Argument: whether to scroll down (1) or up (0)" }
    )
    map("n", "<leader>jso", "<cmd>:call jukit#splits#show_last_cell_output(1)<cr>", {
      desc = "Show output of current cell (determined by current cursor position) in output-history window. Argument: Whether or not to reload outputs if cell id of outputs to display is the same as the last cell id for which outputs were displayed",
    })
    map(

      "n",
      "<leader>johd",
      "<cmd>:call jukit#splits#close_output_and_history(1)<cr>",
      { desc = "Close both windows. Argument: Whether or not to ask you to confirm before closing." }
    )
    map("n", "<leader>jod", "<cmd>:call jukit#splits#close_output_split()<cr>", { desc = "Close output window" })
    map("n", "<leader>jhd", "<cmd>:call jukit#splits#close_history()<cr>", { desc = "Close output-history window" })
    map(

      "n",
      "<leader>johs",
      "<cmd>:call jukit#splits#output_and_history()<cr>",
      { desc = "Shortcut for opening output terminal and output-history" }
    )
    map(
      "n",
      "<leader>jhs",
      "<cmd>:call jukit#splits#history()<cr>",
      { desc = "Opens a new output-history window, where saved ipython outputs are displayed" }
    )
    map(
      "n",
      "<leader>jts",
      "<cmd>:call jukit#splits#term()<cr>",
      { desc = "Opens a new output window without executing any command" }
    )
    map(
      "n",
      "<leader>jts",
      "<cmd>:call jukit#splits#term()<cr>",
      { desc = "Opens a new output window without executing any command" }
    )
    map(
      "n",
      "<leader>jos",
      "<cmd>:call jukit#splits#output()<cr>",
      { desc = "Opens a new output window and executes the command specified in `g:jukit_shell_cmd`" }
    )
    map("n", "<leader>jc", "<cmd>:call DFColumns()<cr>", { desc = "convenience func DFColumns" })
    map("n", "<leader>jh", "<cmd>:call PythonHelp()<cr>", { desc = "convenience func PythonHelp" })
    -- end,
    -- })
  end,
}
