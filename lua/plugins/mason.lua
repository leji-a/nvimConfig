return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		mason_lspconfig.setup({
			ensure_installed = {
				-- lsp
				"lua_ls",
				"zls",
				"rust_analyzer",
				"clangd",
			},
		})
		mason_tool_installer.setup({
			ensure_installed = {
				-- formatters
				"stylua",
				"black",
				"isort",
				"ast_grep",
				-- linter
				"ast_grep",
			},
		})
	end,
}
