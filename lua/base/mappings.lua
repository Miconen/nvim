local utils = require("base.utils")
local maps = utils.get_mappings_template()
local get_icon = utils.get_icon

local icons = {
	search = { desc = get_icon("Search", 1, true) .. "Search" },
	packages = { desc = get_icon("Package", 1, true) .. "Packages" },
	lsp = { desc = get_icon("ActiveLSP", 1, true) .. "LSP" },
	ui = { desc = get_icon("Window", 1, true) .. "UI" },
	buffers = { desc = get_icon("Tab", 1, true) .. "Buffers" },
	sort = { desc = get_icon("Sort", 1, true) .. "Sort Buffers" },
	compiler = { desc = get_icon("Run", 1, true) .. "Compiler" },
	debugger = { desc = get_icon("Debugger", 1, true) .. "Debugger" },
	test = { desc = get_icon("Test", 1, true) .. "Test" },
	docs = { desc = get_icon("Docs", 1, true) .. "Docs" },
	git = { desc = get_icon("Git", 1, true) .. "Git" },
	session = { desc = get_icon("Session", 1, true) .. "Session" },
	terminal = { desc = get_icon("Terminal", 1, true) .. "Terminal" },
	fold = { desc = get_icon("Sort", 1, true) .. "Folds" },
	diagnostic = { desc = get_icon("Diagnostic", 1, true) .. "Diagnostics" },
	db = { desc = get_icon("Database", 1, true) .. "Database" },
}

-- General
require("base.mappings.general")(maps, icons)

-- UI
require("base.mappings.ui")(maps, icons)

-- DAP
require("base.mappings.debug")(maps, icons)

-- Packages
require("base.mappings.packages")(maps, icons)

-- Database
require("base.mappings.database")(maps, icons)

-- Telescope
require("base.mappings.telescope")(maps, icons)

-- Git
require("base.mappings.git")(maps, icons)

-- Miscellanous
require("base.mappings.miscellaneous")(maps, icons)

maps.n["<leader>l"] = icons.lsp

utils.set_mappings(maps)
