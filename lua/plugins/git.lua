-- ~/.config/nvim/lua/plugins/git.lua
return {
    -- Git integration
    "tpope/vim-fugitive",
    -- Git decorations
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("config.gitsigns")
        end,
    },
}

