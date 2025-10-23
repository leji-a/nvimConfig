return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		-- Diagnostic signs
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "",
					[vim.diagnostic.severity.INFO] = "",
				},
			},
			virtual_text = true,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})

		-- LSP keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

				opts.desc = "Show LSP references"
				keymap.set("n", "gR", ":Telescope lsp_references<CR>", opts)

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show documentation"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

				opts.desc = "Toggle inlay hints"
				keymap.set("n", "<leader>ih", function()
					local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf })
					vim.lsp.inlay_hint.enable(not enabled)
				end, opts)
			end,
		})

		-- Auto-format on save for LSP-enabled files
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("LspFormatOnSave", {}),
			callback = function(ev)
				local clients = vim.lsp.get_clients({ bufnr = ev.buf })
				if #clients > 0 then
					vim.lsp.buf.format({
						async = false,
						timeout_ms = 5000,
					})
				end
			end,
		})

		local capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			cmp_nvim_lsp.default_capabilities()
		)

		-- Setup mason
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "rust_analyzer", "zls", "clangd" },
		})

		-- Load neodev before setting up lua_ls
		require("lazy").load({ plugins = { "neodev.nvim" } })
		require("neodev").setup({})

		-- Define server configurations using vim.lsp.config
		vim.lsp.config.lua_ls = {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			root_markers = {
				".luarc.json",
				".luarc.jsonc",
				".luacheckrc",
				".stylua.toml",
				"stylua.toml",
				"selene.toml",
				"selene.yml",
			},
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = { enable = false },
					completion = { callSnippet = "Replace" },
				},
			},
		}

		vim.lsp.config.rust_analyzer = {
			cmd = { "rust-analyzer" },
			filetypes = { "rust" },
			root_markers = { "Cargo.toml", "rust-project.json" },
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
					cargo = {
						allFeatures = true,
					},
					diagnostics = {
						disabled = {},
					},
					completion = {
						autoimport = true,
					},
				},
			},
		}

		vim.lsp.config.zls = {
			cmd = { "zls" },
			filetypes = { "zig", "zir" },
			root_markers = { "zls.json", "build.zig", ".git" },
			capabilities = capabilities,
		}

		vim.lsp.config.clangd = {
			cmd = { "clangd" },
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
			root_markers = {
				".clangd",
				".clang-tidy",
				".clang-format",
				"compile_commands.json",
				"compile_flags.txt",
				"configure.ac",
				".git",
			},
			capabilities = capabilities,
		}

		vim.lsp.config.ts_ls = {
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
			capabilities = capabilities,
		}

		-- Enable LSP servers
		vim.lsp.enable({ "lua_ls", "rust_analyzer", "zls", "clangd", "ts_ls" })
	end,
}
