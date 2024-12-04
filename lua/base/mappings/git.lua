local utils = require("base.utils")
local is_available = utils.is_available

return function(maps, icons)
	maps.n["<leader>g"] = icons.git

	-- Lazygit
	if is_available("snacks.nvim") then
		maps.n["<leader>gz"] = {
			function()
				Snacks.lazygit.open()
			end,
			desc = "Lazygit",
		}

		maps.n["<leader>gh"] = {
			function()
				Snacks.gitbrowse.open()
			end,
			desc = "Open current git project in the browser",
		}
	end

	if is_available("gitsigns.nvim") then
		local gitsigns = require("gitsigns")

		-- TODO: Figure out a better bind for "jump to next/prev" binds
		maps.n["]c"] = {
			function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end,
			desc = "Jump to next git [c]hange",
		}

		maps.n["[c"] = {
			function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end,
			desc = "Jump to previous git [c]hange",
		}

		maps.v["<leader>gs"] = {
			function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
			desc = "stage git hunk",
		}
		maps.v["<leader>gr"] = {
			function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
			desc = "reset git hunk",
		}

		maps.n["]g"] = {
			function()
				gitsigns.nav_hunk("next")
			end,
			desc = "Next Git hunk",
		}
		maps.n["[g"] = {
			function()
				gitsigns.nav_hunk("prev")
			end,
			desc = "Previous Git hunk",
		}
		maps.n["<leader>gl"] = {
			function()
				gitsigns.blame_line()
			end,
			desc = "View Git blame",
		}
		maps.n["<leader>gL"] = {
			function()
				gitsigns.blame_line({ full = true })
			end,
			desc = "View full Git blame",
		}
		maps.n["<leader>gp"] = {
			function()
				gitsigns.preview_hunk()
			end,
			desc = "Preview Git hunk",
		}
		maps.n["<leader>gh"] = {
			function()
				gitsigns.reset_hunk()
			end,
			desc = "Reset Git hunk",
		}
		maps.n["<leader>gr"] = {
			function()
				gitsigns.reset_buffer()
			end,
			desc = "Reset Git buffer",
		}
		maps.n["<leader>gs"] = {
			function()
				gitsigns.stage_hunk()
			end,
			desc = "Stage Git hunk",
		}
		maps.n["<leader>gS"] = {
			function()
				gitsigns.stage_buffer()
			end,
			desc = "Stage Git buffer",
		}
		maps.n["<leader>gu"] = {
			function()
				gitsigns.undo_stage_hunk()
			end,
			desc = "Unstage Git hunk",
		}
		maps.n["<leader>gd"] = {
			function()
				gitsigns.diffthis()
			end,
			desc = "View Git diff",
		}
		maps.n["<leader>gD"] = {
			function()
				gitsigns.diffthis("@")
			end,
			desc = "View Git last commit diff",
		}

		maps.n["<leader>gt"] = "Toggles"
		vim.g.current_line_blame = vim.g.current_line_blame or false
		vim.g.show_deleted_lines = vim.g.show_deleted_lines or false

		Snacks.toggle
			.new({
				name = "Git blame",
				get = function()
					return vim.g.current_line_blame
				end,
				set = function()
					gitsigns.toggle_current_line_blame()
					vim.g.current_line_blame = not vim.g.current_line_blame
				end,
			})
			:map("<leader>gtb")

		Snacks.toggle
			.new({
				name = "Deleted lines",
				get = function()
					return vim.g.show_deleted_lines
				end,
				set = function()
					gitsigns.toggle_deleted()
					vim.g.show_deleted_lines = not vim.g.show_deleted_lines
				end,
			})
			:map("<leader>gtd")
	end
end
