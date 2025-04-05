local utils = require("base.utils")
local is_available = utils.is_available

return function(maps, icons)
	-- Telescope
	if is_available("telescope.nvim") then
		maps.n["<leader>s"] = icons.search

		local builtin = require("telescope.builtin")
		maps.n["<leader>sh"] = { builtin.help_tags, desc = "Help" }
		maps.n["<leader>sk"] = { builtin.keymaps, desc = "Keymaps" }
		maps.n["<leader>sf"] = { builtin.find_files, desc = "Files" }
		maps.n["<leader>ss"] = { builtin.builtin, desc = "Select Telescope" }
		maps.n["<leader>sw"] = { builtin.grep_string, desc = "Current Word" }
		maps.n["<leader>sg"] = { builtin.live_grep, desc = "Grep" }
		maps.n["<leader>sd"] = { builtin.diagnostics, desc = "Diagnostics" }
		maps.n["<leader>s<CR>"] = { builtin.resume, desc = "Resume" }
		maps.n["<leader>s."] = { builtin.oldfiles, desc = 'Recent Files ("." for repeat)' }
		maps.n["<leader>s<leader>"] = { builtin.buffers, desc = "Existing buffers" }

		-- Grep hidden files
		maps.n["<leader>sG"] = {
			function()
				builtin.live_grep({
					additional_args = function()
						return { "--hidden", "--glob", "!**/.git/*" }
					end,
				})
			end,
			desc = "Grep hidden files",
		}

		-- Search hidden files
		maps.n["<leader>sF"] = {
			function()
				builtin.find_files({
					hidden = true,
					no_ignore = true,
					file_ignore_patterns = { ".git/" },
				})
			end,
			desc = "Find Hidden Files",
		}

		maps.n["<leader>/"] = {
			function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end,
			desc = "Fuzzy buffer",
		}

		maps.n["<leader>s/"] = {
			function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end,
			desc = "Fuzzy open buffers",
		}

		-- Shortcut for searching Neovim configuration files
		maps.n["<leader>sn"] = {
			function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Neovim files",
		}

		-- Shortcut for grepping Neovim configuration files
		maps.n["<leader>sN"] = {
			function()
				builtin.live_grep({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Neovim grep",
		}
	end
end
