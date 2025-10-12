return {
    {
        "sainnhe/sonokai",
        config = function()
            vim.g.sonokai_style = "maia"
            vim.cmd.colorscheme("sonokai")
        end,
    },
    { "folke/tokyonight.nvim" },
}
