return {
    -- Code formatter
    {
        "mhartington/formatter.nvim",
        config = function()
            require("formatter").setup({
                logging = true,
                log_level = vim.log.levels.WARN,
                filetype = {
                    lua = { require("formatter.filetypes.lua").stylua },
                    java = { require("formatter.filetypes.java").clangformat },
                    ["*"] = {
                        require("formatter.filetypes.any").remove_trailing_whitespace,
                    },
                },
            })
        end,
    },

    -- Search and replace tool
    {
        "windwp/nvim-spectre",
        cmd = { "Spectre" },
        config = function()
            require("spectre").setup()
        end,
    },

    -- Better input dialogs and select menus
    {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({
                input = { enabled = true },
            })
        end,
    },
}

