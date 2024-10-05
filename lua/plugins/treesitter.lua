return {
    -- Bracket pair rainbow colorization
    {
        "HiPhish/nvim-ts-rainbow2",
        event = { "User FileOpened" },
    },

    -- Show current function or class in floating window
    {
        "romgrk/nvim-treesitter-context",
        lazy = true,
        event = { "User FileOpened" },
        config = function()
            require("treesitter-context").setup({
                enable = true,
                throttle = true,
                max_lines = 0,
                patterns = {
                    default = {
                        "class",
                        "function",
                        "method",
                    },
                },
            })
        end,
    },

    -- Code outline
    {
        "stevearc/aerial.nvim",
        opts = {},
        config = function()
            require("aerial").setup({
                layout = { max_width = { 40, 0.2 }, min_width = 20 },
                filter_kind = { "Class", "Function", "Method", "Module" },
                open_automatic = true,
            })
        end,
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    },
}

