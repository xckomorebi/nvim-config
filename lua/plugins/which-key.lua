return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },

    enabled = function()
        return os.getenv("NVIM_USE_WHICH_KEY")
    end,
}
