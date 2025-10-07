return {
    "nvim-neo-tree/neo-tree.nvim",

    branch = "v3.x",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker",
    },

    keys = {
        { "<leader>b", "<cmd>Neotree<cr>",        desc = "Toggle file explorer" },
        { "<leader>r", "<cmd>Neotree reveal<cr>", desc = "Reveal file" },
    },

    lazy = false,

    opts = {
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_by_pattern = {
                    ".git"
                }
            }
        }
    }
}
