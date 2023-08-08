local utils = require("_oml.theme-daddy.utils")
local config = require("_oml.theme-daddy.utils.config").options
local palettes = require("_oml.theme-daddy.colorscheme.palettes")

local M = {
	palette = config.palette,
	colors = {},
}

local hp = require("_oml.theme-daddy.utils.color_helper")

-- @param palettes
M.setup = function(palette)
	if not vim.tbl_contains(palettes, palette) then
		local msg = "Invalid palette name, using default"
		local level = "info"
		palette = "default"
		utils.notify(msg, level)
	end

	M.palette = palette

	---@module "_td.colorscheme.palette.default"
	local p = require("_oml.theme-daddy.colorscheme.palette." .. M.palette)

	--- @class Colorscheme
	local cs = {}

	cs.editor = {
		background = config.transparent_background and "NONE" or p.background,
		foreground = p.text,
		lineHighlightBackground = hp.blend(p.text, 0.05, p.background),
		selectionBackground = hp.blend(p.dimmed1, 0.15, p.background),
		findMatchBackground = hp.blend(p.text, 0.15, p.background),
		findMatchBorder = p.accent3,
		findMatchHighlightBackground = hp.blend(p.text, 0.15, p.background),
		foldBackground = hp.blend(p.text, 0.1, p.background),
		wordHighlightBackground = hp.blend(p.text, 0.15, p.background),
		selectionHighlightBackground = hp.blend(p.text, 0.15, p.background),
		wordHighlightStrongBackground = hp.blend(p.text, 0.15, p.background),
	}

	cs.editorLineNumber = {
		foreground = p.dimmed4,
		activeForeground = p.dimmed1,
	}

	cs.editorHoverWidget = {
		background = p.dimmed5,
		border = p.background,
	}

	cs.editorSuggestWidget = {
		background = p.dimmed5, -- "#403e41",
		border = p.dimmed5, -- "#403e41",
		foreground = p.dimmed1, -- "#c1c0c0",
		highlightForeground = p.text, -- "#f6f6f6",
		selectedBackground = p.dimmed3, -- "#727072",
	}

	cs.editorIndentGuide = {
		background = p.dimmed5, -- "#403e41",
		activeBackground = p.dimmed3, -- "#727072",
	}

	cs.editorGutter = {
		addedBackground = p.accent4, -- "#81f900",
		deletedBackground = p.accent1, -- "#ff3f4f",
		modifiedBackground = p.accent2, -- "#e5a422",
	}

	cs.sideBar = {
		background = p.dark1, -- "#221f22",
		foreground = p.dimmed2, -- "#939293",
	}

	cs.sideBarTitle = {
		foreground = p.dimmed4, -- "#5c6370",
	}

	cs.list = {
		activeSelectionBackground = hp.blend(p.text, 0.11, cs.sideBar.background),
	}

	cs.sideBarSectionHeader = {
		background = p.dark1, -- "#221f22",
		foreground = p.dimmed3, -- "#727072",
	}

	cs.breadcrumb = {
		foreground = p.dimmed2, -- "#939293",
	}

	cs.button = {
		background = p.dimmed5, -- "#403e41",
		foreground = p.dimmed1, -- "#c1c0c0",
		hoverBackground = p.dimmed4, -- "#5c6370",
		separator = p.background, -- "#1e1e1e",
	}

	cs.scrollbarSlider = {
		hoverBackground = hp.blend(p.dimmed1, 0.15, p.background), -- "#???", -- background: background
	}

	cs.gitDecoration = {
		addedResourceForeground = p.accent4, -- "#81f900",
		conflictingResourceForeground = p.accent2, -- "#e5a422",
		deletedResourceForeground = p.accent1, -- "#ff3f4f",
		ignoredResourceForeground = p.dimmed4, -- "#5b595c",
		modifiedResourceForeground = p.accent3, -- "#ffd945",
		stageDeletedResourceForeground = p.accent1, -- "#ff3f4f",
		stageModifiedResourceForeground = p.accent3, -- "#ffd945",
		untrackedResourceForeground = p.dimmed1, -- "#c1c0c0",
	}

	cs.inputValidation = {
		errorBackground = p.dimmed5, -- "#403e41",
		errorBorder = p.pink, -- "#ff007c",
		errorForeground = p.pink, --"#ff007c",
		infoBackground = p.dimmed5, -- "#403e41",
		infoBorder = p.accent5, --"#00a0e4",
		infoForeground = p.accent5, --"#00a0e4",
		warningBackground = p.dimmed5, --"#403e41",
		warningBorder = p.accent2, --"#fc9867",
		warningForeground = p.accent2, --"#fc9867",
	}

	cs.errorLens = {
		errorBackground = hp.blend(p.accent1, 0.1),
		errorForeground = p.accent1,
		warningBackground = hp.blend(p.accent2, 0.1),
		warningForeground = p.accent2,
		infoBackground = hp.blend(p.accent5, 0.1),
		infoForeground = p.accent5,
		hintBackground = hp.blend(p.accent5, 0.1),
		hintForeground = p.accent5,
	}

	cs.terminal = {
		background = p.dimmed5, -- "#403e41",
		foreground = p.text, -- "#f6f6f6",
	}

	cs.terminalCursor = {
		background = "#ffffff", -- "#00000000",
		foreground = p.text, -- "#fcfcfa",
	}

	cs.editorGroupHeader = {
		tabsBackground = p.dark1, -- "#221f22",
		tabsBorder = p.dark1, -- "#221f22",
	}

	cs.tab = {
		activeBackground = config.transparent_background and "NONE" or p.background, -- "#1e1e1e",
		activeBorder = p.accent3, -- "#ffd945",
		activeForeground = p.accent3, -- "#ffd945",
		inactiveBackground = hp.lighten(p.background, 15),
		inactiveForeground = p.dimmed2, -- "#939293",
		unfocusedActiveBackground = p.background, -- "#1e1e1e",
		unfocusedActiveBorder = p.dimmed2, -- "#939293",
		unfocusedActiveForeground = p.dimmed1, -- "#c1c0c0",
	}

	cs.statusBar = {
		-- background = p.dark1,
		background = p.dark2,
		foreground = p.dimmed3,
		activeForeground = p.dimmed1,
	}

	cs.diffEditor = {
		insertedLineBackground = hp.blend(p.accent4, 0.1, p.dark1),
		removedLineBackground = hp.blend(p.accent1, 0.1, p.dark1),
		modifiedLineBackground = hp.blend(p.accent2, 0.1, p.dark1),
	}

	cs.diffEditorOverview = {
		insertedForeground = hp.blend(p.accent4, 0.65, cs.diffEditor.insertedLineBackground),
		removedForeground = hp.blend(p.accent1, 0.65, cs.diffEditor.removedLineBackground),
		modifiedForeground = hp.blend(p.accent2, 0.65, cs.diffEditor.modifiedLineBackground),
	}

	cs.base = p

	M.colors = cs
	return cs
end

return M
