return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
			vim.keymap.set("n", "<leader>cm", ":Mason<CR>", { desc = "Open Mason" })
		end,
	},
	{
		-- "williamboman/mason-lspconfig.nvim",
		-- lazy = false,
		-- opts = {
		-- 	auto_install = true,
		-- },
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		-- dependencies = {
		-- 	{ "mason-org/mason.nvim", opts = {} },
		-- },
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- lspconfig.lua_ls.setup({ capabilities = capabilities })
			-- lspconfig.ts_ls.setup({ capabilities = capabilities })
			-- lspconfig.angularls.setup({ capabilities = capabilities })
			local lspconfig_defaults = lspconfig.util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				"force",
				lspconfig_defaults.capabilities,
				require("cmp_nvim_lsp").default_capabilities()
			)
			--
			require("mason-lspconfig").setup({
				handlers = {
					function(server)
						lspconfig[server].setup({ capabilities = capabilities })
					end,
				},
			})

			---
			lspconfig.cssls.setup({
				settings = {
					css = {
						validate = true,
						lint = {
							unknownAtRules = "igonre",
						},
					},
				},
			})

			-- configure html server
			-- function on_attach(client, bufnr)
			-- 	-- don't format files, I prefer using prettier
			-- 	client.server_capabilities.document_formatting = false
			-- 	on_attach(client, bufnr)
			-- end
			-- lspconfig["html"].setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	init_options = {
			-- 		configurationSection = { "html", "css", "javascript" },
			-- 		embeddedLanguages = {
			-- 			css = true,
			-- 			javascript = true,
			-- 		},
			-- 		provideFormatter = true,
			-- 	},
			-- })
			---
			-- require("mason-lspconfig").setup_handlers({
			-- require("mason-lspconfig").setup_handlers({
			-- 	function(server)
			-- 		lspconfig[server].setup({})
			-- 	end,
			-- })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Definition" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Format" })
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "Show References" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
			vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "LSP Diagnostics" })
			vim.keymap.set("n", "<leader>dn", function()
				vim.diagnostic.goto_next()
			end, { desc = "Jump to next diagnostics" })
			vim.keymap.set("n", "<leader>dp", function()
				vim.diagnostic.goto_prev()
			end, { desc = "Jump to previous diagnostics" })
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, { desc = "Show Signature Help " })
		end,
	},
}
