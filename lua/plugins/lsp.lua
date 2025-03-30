return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    -- Import plugins
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    -- Configure diagnostic signs using the modern approach
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
          [vim.diagnostic.severity.INFO] = " ",
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
        source = "always",
        header = "",
        prefix = "",
      },
    })

    -- Configure LSP keymaps on attach
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- local opts = { buffer = ev.buf, silent = true }

        -- Navigation
        --opts.desc = "Show LSP references"
        --keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        --
        --opts.desc = "Go to declaration"
        --keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        --
        --opts.desc = "Show LSP definitions"
        --keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        --
        --opts.desc = "Show LSP implementations"
        --keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        --
        --opts.desc = "Show LSP type definitions"
        --keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        --
        ---- Code actions
        --opts.desc = "See available code actions"
        --keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        --
        --opts.desc = "Smart rename"
        --keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        --
        ---- Diagnostics
        --opts.desc = "Show buffer diagnostics"
        --keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        --
        --opts.desc = "Show line diagnostics"
        --keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        --
        --opts.desc = "Go to previous diagnostic"
        --keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        --
        --opts.desc = "Go to next diagnostic"
        --keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        --
        ---- Documentation
        --opts.desc = "Show documentation for what is under cursor"
        --keymap.set("n", "K", vim.lsp.buf.hover, opts)
        --
        ---- LSP management
        --opts.desc = "Restart LSP"
        --keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    -- Configure LSP capabilities with cmp integration
    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      cmp_nvim_lsp.default_capabilities()
    )

    -- Configure language servers
    mason_lspconfig.setup_handlers({
      -- Default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,

      -- Server-specific configurations

      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } }, -- Recognize vim global
              completion = { callSnippet = "Replace" },
            },
          },
        })
      end,
    })
  end,
}
