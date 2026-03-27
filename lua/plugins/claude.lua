return {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
        focus_after_send = false,
        terminal = {
            provider = "native",
            split_width_percentage = 0.35,
            split_side = "right",
            show_native_term_exit_tip = false,
            auto_close = true,
            snacks_win_opts = {},
        },
        diff_opts = {
            open_in_current_tab = false,
            keep_terminal_focus = true,
            layout = "vertical",
            open_in_new_tab = false,
            hide_terminal_in_new_tab = false,
            on_new_file_reject = "keep_empty",
        }
    },

    keys = {
        { "<leader>aa", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
        { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
        { "<leader>at", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
    },
}
