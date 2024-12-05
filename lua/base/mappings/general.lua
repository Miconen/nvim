return function(maps, icons)
	maps.n["<Esc>"] = { "<cmd>nohlsearch<CR>", desc = "Clear highlights on search when pressing <Esc> in normal mode" }
	maps.n["<leader>q"] = { vim.diagnostic.setloclist, desc = "Quickfix list" }
	maps.t["<Esc><Esc>"] = { "<C-\\><C-n>", desc = "Exit terminal mode" }

	-- Keybinds to make split navigation easier.
	maps.n["<C-h>"] = { "<C-w><C-h>", desc = "Move focus to the left window" }
	maps.n["<C-l>"] = { "<C-w><C-l>", desc = "Move focus to the right window" }
	maps.n["<C-j>"] = { "<C-w><C-j>", desc = "Move focus to the lower window" }
	maps.n["<C-k>"] = { "<C-w><C-k>", desc = "Move focus to the upper window" }
	maps.n["vs"] = { "<cmd>vs<CR>", desc = "Vertical split" }
	maps.n["sp"] = { "<cmd>sp<CR>", desc = "Vertical split" }

	if is_available("todo-comments.nvim") then
		local todo_comments = require("todo-comments")

		maps.n["<leader>ut"] = {
			function()
				vim.api.nvim_command("TodoTelescope")
			end,
			desc = "Show todo comments",
		}

		maps.n["]t"] = {
			function()
				todo_comments.jump_next()
			end,
			desc = "Next todo comment",
		}

		maps.n["[t"] = {
			function()
				todo_comments.jump_prev()
			end,
			desc = "Previous todo comment",
		}
	end
end
