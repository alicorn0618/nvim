return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        
        -- on_attach function
        local on_attach = function(client, bufnr)
            -- LSP keybindings and configuration, etc.
            -- ... (keep your on_attach function as is)
        end

        -- Language-specific LSP configurations
        lspconfig.pylsp.setup({ on_attach = on_attach })
        lspconfig.gopls.setup({ on_attach = on_attach })
        lspconfig.lua_ls.setup({
            on_attach = on_attach,
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                    telemetry = { enable = false },
                },
            },
        })
        lspconfig.bashls.setup({ on_attach = on_attach })
        lspconfig.rust_analyzer.setup({ on_attach = on_attach })
        lspconfig.clangd.setup({ on_attach = on_attach })
        lspconfig.ocamllsp.setup({ on_attach = on_attach })
        lspconfig.ruby_lsp.setup({ on_attach = on_attach })
        lspconfig.hls.setup({ on_attach = on_attach })
    end,
}

