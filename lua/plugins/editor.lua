-- plugins/editor.lua

return {
	-- Detect tabstop/shiftwidth automatically
	"tpope/vim-sleuth",

	-- Mini.nvim collection
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			-- Better text objects: va), yinq, ci'
			require("mini.ai").setup({ n_lines = 500 })

			-- Surround: saiw), sd', sr)'
			require("mini.surround").setup({})

			-- Icons (used by statusline and other mini modules)
			require("mini.icons").setup({})

			-- File explorer
			require("mini.files").setup({
				options = {
					use_as_default_explorer = true,
				},
			})

			-- Git diff signs in the gutter + overlay
			require("mini.diff").setup({
				view = {
					style = "sign",
					signs = { add = "▎", change = "▎", delete = "" },
				},
			})

			-- Git blame / log integration
			require("mini.git").setup({})

			-- Statusline
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},

	-- Autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
		-- blink.cmp integration is handled in plugins/lsp.lua
	},
}
