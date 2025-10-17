return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "edkolev/tmuxline.vim",
    },

    opts = {
        options = {
            globalstatus = true,
            disabled_filetypes = {
            },
        },

        -- sections = {
        --     lualine_c = {
        --         "buffers",
        --     },
        -- },
        -- inactive_sections = {
        --     lualine_a = {},
        --     lualine_b = {},
        --     lualine_c = {},
        --     lualine_x = {},
        --     lualine_y = {},
        --     lualine_z = {}
        -- }
    }
}
