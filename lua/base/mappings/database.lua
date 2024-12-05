local utils = require("base.utils")
local is_available = utils.is_available

return function(maps, icons)
	if not is_available("vim-dadbod") then
		return
	end

	maps.n["<leader>d"] = icons.db
	maps.n["<leader>db"] = {
		function()
			vim.api.nvim_command("DBUIToggle")
		end,
		desc = "Open DB UI",
	}
end
