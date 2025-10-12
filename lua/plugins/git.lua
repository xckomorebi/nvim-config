return {
    "tpope/vim-fugitive",
    {
        "airblade/vim-gitgutter",
        keys = {
            { "<leader>hd", "<cmd>Gvdiffsplit<cr>", desc = "Git Diff File" },
        },
    },
    {
        "tanvirtin/vgit.nvim",
        event = "VimEnter",
        config = function()
            require("vgit").setup()
        end
    },
}
