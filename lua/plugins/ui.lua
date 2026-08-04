-- plugins/ui.lua

return {
	-- Colorscheme
	-- {
	-- 	"tiagovla/tokyodark.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent_background = false,
	-- 		gamma = 1.00,
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("tokyodark").setup(opts)
	-- 		vim.cmd.colorscheme("tokyodark")
	-- 	end,
	-- },

	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
		config = function(_, opts)
			require("cyberdream").setup(opts)
			vim.cmd.colorscheme("cyberdream")
		end,
	},

	-- Which-key: keybind hints
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			win = {
				col = 0,
				width = { min = 30, max = 40 },
				height = { min = 15, max = 60 },
			},
			layout = {
				width = { min = 20, max = 40 },
				spacing = 3,
				align = "left",
			},
			icons = {
				rules = false, -- use nerd font icons from mappings
			},
		},
	},

	-- Snacks: swiss-army utilities
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			notifier = { enabled = true, timeout = 3000 },
			quickfile = { enabled = true },
			words = { enabled = true },
			toggle = { which_key = true },
			rename = { enabled = true },
			gitbrowse = { enabled = true },
			lazygit = { enabled = true },
			terminal = { enabled = true },
			scratch = { enabled = true },
			dim = { enabled = true },
			zen = { enabled = true },
			-- Dashboard disabled intentionally
			dashboard = { enabled = false },
			-- Statuscolumn: nicer fold/sign/number column
			statuscolumn = { enabled = true },
			-- Picker replaces telescope
			picker = {
				enabled = true,
				ui_select = true, -- replace vim.ui.select
			},
		},
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			indent = { char = "│" },
			scope = { enabled = true },
		},
	},

	-- Todo comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	-- CSVView
	{
		"hat0uma/csvview.nvim",
		opts = {
			parser = { comments = { "#", "//" } },
			keymaps = {
				-- Text objects for selecting fields
				textobject_field_inner = { "if", mode = { "o", "x" } },
				textobject_field_outer = { "af", mode = { "o", "x" } },
				-- Excel-like navigation:
				-- Use <Tab> and <S-Tab> to move horizontally between fields.
				-- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
				-- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
				jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
				jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
				jump_next_row = { "<Enter>", mode = { "n", "v" } },
				jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
			},
		},
		cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
	},
}
