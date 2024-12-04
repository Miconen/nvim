local utils = require("base.utils")
local is_available = utils.is_available

return function(maps, icons)
	-- Mini
	if is_available("mini.nvim") then
		local files = require("mini.files")
		maps.n["-"] = {
			function()
				if not files.close() then
					files.open(vim.api.nvim_buf_get_name(0), false)
					vim.schedule(function()
						files.reveal_cwd()
					end)
				end
			end,
		}
	end

	-- Query for plugin availability
	maps.n["<leader>sA"] = {
		function()
			-- Get user input
			vim.ui.input({ prompt = "Search: " }, function(search)
				if search then
					-- Search for the input
					local available = is_available(search)
					vim.notify("Plugin available: " .. tostring(available), vim.log.levels.INFO)
				end
			end)
		end,
		desc = "Query plugin availability",
	}
end
