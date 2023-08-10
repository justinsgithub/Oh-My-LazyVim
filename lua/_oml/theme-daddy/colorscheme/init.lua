local utils = require("_oml.theme-daddy.utils")
local config = require("_oml.theme-daddy.utils.config").options

local themes = utils.themes

local M = {
  theme = config.theme,
  colors = {},
}

local hp = require("_oml.theme-daddy.utils.color_helper")

-- @param palettes
M.setup = function(_theme)
  if not vim.tbl_contains(themes, _theme) then
    local msg = "Invalid theme name, using default"
    local level = "info"
    _theme = "default"
    utils.notify(msg, level)
  end

  M.theme = _theme

  ---@module "_oml.theme-daddy.colorscheme.themes.default"
  local theme = require("_oml.theme-daddy.colorscheme.themes." .. M.theme)

  --- @class Colorscheme
  local cs = {}

  cs.editor = {
    background = config.transparent_background and "NONE" or theme.background,
    foreground = theme.text,
    lineHighlightBackground = hp.blend(theme.text, 0.05, theme.background),
    selectionBackground = hp.blend(theme.dimmed1, 0.15, theme.background),
    findMatchBackground = hp.blend(theme.text, 0.15, theme.background),
    findMatchBorder = theme.accent3,
    findMatchHighlightBackground = hp.blend(theme.text, 0.15, theme.background),
    foldBackground = hp.blend(theme.text, 0.1, theme.background),
    wordHighlightBackground = hp.blend(theme.text, 0.15, theme.background),
    selectionHighlightBackground = hp.blend(theme.text, 0.15, theme.background),
    wordHighlightStrongBackground = hp.blend(theme.text, 0.15, theme.background),
  }

  cs.editorLineNumber = {
    foreground = theme.dimmed4,
    activeForeground = theme.dimmed1,
  }

  cs.editorHoverWidget = {
    background = theme.dimmed5,
    border = theme.background,
  }

  cs.editorSuggestWidget = {
    background = theme.dimmed5,
    border = theme.dimmed5,
    foreground = theme.dimmed1,
    highlightForeground = theme.text,
    selectedBackground = theme.dimmed3,
  }

  cs.editorIndentGuide = {
    background = theme.dimmed5,
    activeBackground = theme.dimmed3,
  }

  cs.editorGutter = {
    addedBackground = theme.accent4,
    deletedBackground = theme.accent1,
    modifiedBackground = theme.accent2,
  }

  cs.sideBar = theme.sideBar

  cs.sideBarTitle = {
    foreground = theme.dimmed4,
  }

  cs.list = {
    activeSelectionBackground = hp.blend(theme.text, 0.11, cs.sideBar.background),
  }

  cs.sideBarSectionHeader = {
    background = theme.dark1,
    foreground = theme.dimmed3,
  }

  cs.breadcrumb = {
    foreground = theme.dimmed2,
  }

  cs.button = {
    background = theme.dimmed5,
    foreground = theme.dimmed1,
    hoverBackground = theme.dimmed4,
    separator = theme.background,
  }

  cs.scrollbarSlider = {
    hoverBackground = hp.blend(theme.dimmed1, 0.15, theme.background),
  }

  cs.gitDecoration = {
    addedResourceForeground = theme.accent4,
    conflictingResourceForeground = theme.accent2,
    deletedResourceForeground = theme.accent1,
    ignoredResourceForeground = theme.dimmed4,
    modifiedResourceForeground = theme.accent3,
    stageDeletedResourceForeground = theme.accent1,
    stageModifiedResourceForeground = theme.accent3,
    untrackedResourceForeground = theme.dimmed1,
  }

  cs.inputValidation = {
    errorBackground = theme.dimmed5,
    errorBorder = theme.pink,
    errorForeground = theme.pink,
    infoBackground = theme.dimmed5,
    infoBorder = theme.accent5,
    infoForeground = theme.accent5,
    warningBackground = theme.dimmed5,
    warningBorder = theme.accent2,
    warningForeground = theme.accent2,
  }

  cs.errorLens = {
    errorBackground = hp.blend(theme.accent1, 0.1),
    errorForeground = theme.accent1,
    warningBackground = hp.blend(theme.accent2, 0.1),
    warningForeground = theme.accent2,
    infoBackground = hp.blend(theme.accent5, 0.1),
    infoForeground = theme.accent5,
    hintBackground = hp.blend(theme.accent5, 0.1),
    hintForeground = theme.accent5,
  }

  cs.terminal = {
    background = theme.dimmed5,
    foreground = theme.text,
  }

  cs.terminalCursor = {
    background = "#ffffff",
    foreground = theme.text,
  }

  cs.editorGroupHeader = {
    tabsBackground = theme.dark1,
    tabsBorder = theme.dark1,
  }

  cs.tab = {
    activeBackground = config.transparent_background and "NONE" or theme.background,
    activeBorder = theme.accent3,
    activeForeground = theme.accent3,
    inactiveBackground = hp.lighten(theme.background, 15),
    inactiveForeground = theme.dimmed2,
    unfocusedActiveBackground = theme.background,
    unfocusedActiveBorder = theme.dimmed2,
    unfocusedActiveForeground = theme.dimmed1,
  }

  cs.statusBar = {
    background = theme.dark2,
    foreground = theme.dimmed3,
    activeForeground = theme.dimmed1,
  }

  cs.diffEditor = {
    insertedLineBackground = hp.blend(theme.accent4, 0.1, theme.dark1),
    removedLineBackground = hp.blend(theme.accent1, 0.1, theme.dark1),
    modifiedLineBackground = hp.blend(theme.accent2, 0.1, theme.dark1),
  }

  cs.diffEditorOverview = {
    insertedForeground = hp.blend(theme.accent4, 0.65, cs.diffEditor.insertedLineBackground),
    removedForeground = hp.blend(theme.accent1, 0.65, cs.diffEditor.removedLineBackground),
    modifiedForeground = hp.blend(theme.accent2, 0.65, cs.diffEditor.modifiedLineBackground),
  }

  cs.base = theme

  M.colors = cs
  return cs
end

return M
