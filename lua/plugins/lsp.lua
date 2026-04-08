return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local opts = { noremap = true, silent = true, buffer = args.buf }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			end,
		})

		local servers = { "rust_analyzer", "clangd", "zls" }
		for _, server in ipairs(servers) do
			vim.lsp.config(server, {})
			vim.lsp.enable(server)
		end

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					workspace = {
						checkThirdParty = false,
						library = vim.api.nvim_get_runtime_file("", true),
					},
					diagnostics = {
						globals = { "vim" },
					},
					telemetry = { enable = false },
				},
			},
		})
		vim.lsp.enable("lua_ls")
	end,
}
