return {
    "zbirenbaum/copilot.lua",
    dependencies = {
        "copilotlsp-nvim/copilot-lsp",
        init = function()
            vim.g.copilot_nes_debounce = 1000
        end
    },
    cmd = "Copilot",
    event = "InsertEnter",

    opts = {
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = false,
            },
        },
        nes = {
            enabled = true,
            auto_trigger = true,
            keymap = {
                dismiss = "<Esc>",
                accept = false,
                accept_and_goto = "<leader>p"
            }
        }
    },

    config = function(_, opts)
        require("copilot").setup(opts)

        local suggestion = require("copilot.suggestion")

        -- Smart Tab: accept suggestion if visible, otherwise insert tab
        vim.keymap.set("i", "<Tab>", function()
            if suggestion.is_visible() then
                suggestion.accept()
            else
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
            end
        end, { desc = "Accept Copilot suggestion or insert tab" })
    end
}
