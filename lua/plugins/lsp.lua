return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local opts = { noremap = true, silent = true, buffer = args.buf }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			end,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					workspace = {
						checkThirdParty = false,
						library = vim.api.nvim_get_runtime_file("", true),
					},
					diagnostics = { globals = { "vim" } },
					telemetry = { enable = false },
				},
			},
		})

		local servers = { "rust_analyzer", "clangd", "zls", "lua_ls", "ts_ls" }
		for _, server in ipairs(servers) do
			vim.lsp.enable(server)
		end
	end,
}
