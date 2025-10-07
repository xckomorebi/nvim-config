return {
    "tpope/vim-fugitive",

    {
        "tanvirtin/vgit.nvim",
        event = "VimEnter",

        depedencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("vgit").setup()
        end,
    }

    -- enabled = false,
}
