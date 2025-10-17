return {
    "folke/noice.nvim",

    event = "VeryLazy",

    dependencies = {
        "MunifTanjim/nui.nvim",
        { "rcarriga/nvim-notify", opts = { top_down = false } },
        "ibhagwan/fzf-lua",
    },

    keys = {
        { "<leader>nd", "<cmd>NoiceDismiss<cr>", desc = "Noice Dismiss Messages" },
    },

    opts = {
        views = {
            cmdline_output = {
                enter = true,
                relative = "win"
            },
            messages = {
                relative = "win"
            },
        },
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = false,
            lsp_doc_border = false,
        },
        routes = {
            {
                view = "cmdline_output",
                filter = {
                    event = "msg_show",
                    kind = { "shell_out", "shell_err" },
                },
            },
            {
                view = "messages",
                filter = {
                    event = "msg_show",
                    kind = { "list_cmd" },
                },
            },
        }
    },
}
