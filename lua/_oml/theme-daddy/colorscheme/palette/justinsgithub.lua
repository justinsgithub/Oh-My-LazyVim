local red = '#ff3f4f'
local darkerer_grey = '#221f22'
local darkest_grey = '#1e1e1e'
local black = '#19181a'
local white = '#fcfcfa'
local dirty_white = '#f6f6f6'
local magenta = '#bf40bf'
local purple = '#e542ff'
local yellow = '#ffd945'
local orange = '#ff8b39'
local green = '#81f900'
local leaf = '#6fd80d'
local blue = '#007dd8'
local sky = '#00a0e4'
local teal = '#19d1e5'
local pink = '#ff007c'
local cyan = '#00dfff'
local light_grey = '#c1c0c0'
local grey = '#939293'
local greyish = '#5b595c'
local dark_grey = '#727072'
local darker_grey = '#403e41'
local blue_grey = '#5c6370'

return {
  background = darkest_grey,
  text = white,
  dark = black,
  dark2 = black,
  dark1 = darkerer_grey,
  accent1 = red,
  accent2 = orange,
  accent3 = yellow,
  accent4 = purple,
  accent5 = sky,
  dimmed1 = light_grey,
  dimmed2 = grey, -- border
  dimmed3 = dark_grey,
  dimmed4 = blue_grey,
  dimmed5 = darker_grey,
  delimiter = white,
  character = purple,
  number = purple,
  boolean = purple,
  float = purple,
  op = red,
  kword = red,
  exc = red,
  label = red,
  peat = red,
  include = red,
  define = red,
  macro = red,
  precondit = red,
  statement = red,
  preproc = yellow,
  str = yellow,
  identifier = orange,
  func = purple,
  tag = orange,
  type = blue,
  todo = pink,
  typedef = pink,
  storageclass = pink,
  conditional = pink,
  constant = pink,
  special = cyan,
  specialchar = cyan,
  structure = cyan,
  comment = dark_grey,
  specialcomment = dark_grey,
  styles = {
    comment = { italic = true },
    keyword = { italic = true }, -- any other keyword
    type = { italic = true }, -- (preferred) int, long, char, etc
    storageclass = { italic = true }, -- static, register, volatile, etc
    structure = { italic = true }, -- struct, union, enum, etc
    parameter = { italic = true }, -- parameter pass in function
    annotation = { italic = true },
    tag_attribute = { italic = true }, -- attribute of tag in reactjs
  },
  teal = teal,
  blue = blue,
  green = green,
  orange = orange,
  black = black,
  white = white,
  magenta = purple,
  red = red,
  yellow = yellow,
  pink = pink,
  cyan = cyan,
}
