return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nightfly_custom = require("lualine.themes.nightfly")
		nightfly_custom.normal.c.bg = "#00000000"
		nightfly_custom.inactive.c.bg = "#00000000"
		require("lualine").setup({
			options = {
				theme = nightfly_custom,
				section_separators = { left = "", right = "" },
				component_separators = { left = " ", right = " " },
				disabled_filetypes = {
					statusline = { "neo-tree" },
					winbar = { "neo-tree" },
				},
				always_show_tabline = false,
				globalstatus = true,
				ignore_focus = { "neo-tree" },
			},

			sections = {
				lualine_b = {
					{ "branch", icon = { "", align = "left" } },
					{
						"diff",
						colored = true,
						symbols = { added = " ", modified = " ", removed = " " },
					},
					{
						"diagnostics",
						colored = true,
						symbols = { error = " ", warn = " ", info = " " },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
