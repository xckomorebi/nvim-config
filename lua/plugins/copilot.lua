return {
    "zbirenbaum/copilot.lua",
    dependencies = {
        "copilotlsp-nvim/copilot-lsp",
        init = function()
            vim.g.copilot_nes_debounce = 500
        end,
    },
    cmd = "Copilot",
    event = "InsertEnter",

    -- opts = {
    --     suggestion = {
    --         auto_trigger = true,
    --         keymap = {
    --             accept = "<C-i>",
    --         },
    --     },
    -- }
}
