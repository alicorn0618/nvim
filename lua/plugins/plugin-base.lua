return {
    -- Filetype detection and override
    {
        "nathom/filetype.nvim",
        event = "User FileOpened",
        config = function()
            require("filetype").setup({
                overrides = {
                    extensions = {
                        h = "cpp", -- Treat `.h` files as C++ files
                    },
                },
            })
        end,
    },

    -- Match pairs highlighting
    {
        "andymass/vim-matchup",
        event = { "User FileOpened" },
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
    },

    -- Highlight, jump between pairs like if..else
    { "felipec/vim-sanegx", event = "BufRead" },

    -- Scope management for tab pages
    { "tiagovla/scope.nvim" },

    -- Quick and easy highlighting
    { "azabiong/vim-highlighter" },
}

