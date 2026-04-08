return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "ts_ls", "zls" },
			automatic_enable = false,
		})

		require("mason-tool-installer").setup({
			ensure_installed = { "stylua", "prettier", "eslint_d", "jsonlint", "ast_grep" },
		})
	end,
}
