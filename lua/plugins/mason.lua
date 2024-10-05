return {{
    -- LSP manager
    "williamboman/mason.nvim",
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
    end,
},
-- Mason LSP configuration
{
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "pylsp", "lua_ls", "bashls", "clangd" },
        })
    end,
},
 -- Null-ls integration for formatting and linting
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            -- Setup mason-null-ls to ensure formatters/linters are installed
            require("mason-null-ls").setup({
                ensure_installed = { }, -- Adjust to your needs
            })

            -- Configure null-ls
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- Formatters
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.black,
                    -- Linters
                    null_ls.builtins.diagnostics.eslint_d,
                },
                -- Enable formatting on save
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            })
        end,
    }
}
