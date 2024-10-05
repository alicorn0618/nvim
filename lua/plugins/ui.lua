-- ~/.config/nvim/lua/plugins/ui.lua
return{
    -- Colorscheme
    {"tanvirtin/monokai.nvim"},
    -- Better UI
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("config.lualine")
        end,
    },
    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("config.nvim-tree")
        end,
    },
     -- Status line
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                theme = "vscode",
            })
        end,
    },

    -- Buffer/tabline management
    {
        "akinsho/bufferline.nvim",
        version = "*",
        config = function()
            vim.g.termguicolors = true -- Enable 24-bit RGB colors
            require("bufferline").setup({})
        end,
    },

    -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                popup_border_style = "rounded",
            })
        end,
    },

    -- Dashboard on startup
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup({})
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },

    -- Notifications
    {
        "rcarriga/nvim-notify",
        lazy = true,
        event = "VeryLazy",
        config = function()
            local notify = require("notify")
            notify.setup({
                stages = "slide",
                timeout = 2000,
                fps = 1,
                background_colour = "Normal",
                max_width = math.floor(vim.api.nvim_win_get_width(0) / 2),
                max_height = math.floor(vim.api.nvim_win_get_height(0) / 4),
                level = "WARN",
            })
            vim.notify = notify
        end,
    },

    -- Custom UI enhancements
    {
        "folke/noice.nvim",
        enabled = ENABLE_NOICE,
        event = { "BufRead", "BufNewFile" },
        dependencies = { "rcarriga/nvim-notify", "MunifTanjim/nui.nvim" },
        config = function()
            require("noice").setup({
                lsp = { progress = { enabled = false } },
                presets = {
                    command_palette = true,
                    long_message_to_split = true,
                    lsp_doc_border = true,
                },
                messages = {
                    view = "notify",
                    view_error = "notify",
                    view_warn = "notify",
                    view_search = "virtualtext",
                },
                health = { checker = false },
            })
        end,
    },

    -- Highlight indent guides and chunks
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("hlchunk").setup({
                indent = { enable = true },
            })
        end,
    },
}

