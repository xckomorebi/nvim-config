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

        ---@diagnostic disable: undefined-field
        sections = {
            lualine_x = {
                {
                    require("noice").api.status.command.get,
                    cond = require("noice").api.status.command.has,
                    color = { fg = "#ff9e64" },
                },
                {
                    require("noice").api.status.mode.get,
                    cond = require("noice").api.status.mode.has,
                    color = { fg = "#ff9e64" },
                }
            }
        }
    }
}
