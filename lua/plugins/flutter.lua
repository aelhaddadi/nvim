return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({
			ui = {
				-- Use rounded borders for floating windows (LSP info, etc.)
				border = "rounded",
				-- Notification style: "native" uses nvim's default, "notify" uses nvim-notify
				notification_style = "native",
			},
			lsp = {
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					-- This shows the horizontal lines connecting parent/child widgets
					renderTextMode = "on",
				},
			},
			decorations = {
				statusline = {
					app_version = true,
					device = true,
					project_config = true,
				},
			},
			widget_guides = {
				enabled = true,
			},
		})
		require("telescope").load_extension("flutter")
	end,
}
