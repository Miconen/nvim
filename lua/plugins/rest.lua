-- plugins/rest.lua
return {
	{
		"mistweaverco/kulala.nvim",
		ft = { "http" },
		keys = {
			{
				"<C-y>",
				function()
					require("kulala").run()
				end,
				ft = "http",
				desc = " Run request",
			},
			{
				"<C-n>",
				function()
					require("kulala").jump_next()
				end,
				ft = "http",
				desc = "Next request",
			},
			{
				"<C-p>",
				function()
					require("kulala").jump_prev()
				end,
				ft = "http",
				desc = "Prev request",
			},
		},
		opts = {
			contenttypes = {
				["application/problem%+json"] = "application/json",
			},
		},
	},
}
