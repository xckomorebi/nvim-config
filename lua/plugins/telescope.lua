local function find_files_or_git_files()
    if vim.fn.isdirectory('.git') == 1 then
        vim.cmd('Telescope git_files')
    else
        vim.cmd('Telescope find_files')
    end
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "fannheyward/telescope-coc.nvim",
    },

    config = function()
        local telescope = require("telescope")
        local lga_actions = require("telescope-live-grep-args.actions")

        telescope.setup({
            defaults = {
                sorting_strategy = "ascending",
                mappings = {
                    n = {
                        d = "delete_buffer",
                    }
                }
            },
            extensions = {
                coc = {},
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                    mappings = {         -- extend mappings
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        },
                    },
                },
            }
        })

        telescope.load_extension("coc")
        telescope.load_extension("live_grep_args")
    end,

    keys = {
        { "<leader>fp", "<cmd>Telescope find_files<cr>",           desc = "Find files" },
        { "<leader>fP", find_files_or_git_files,                   desc = "Find files (git-aware)" },
        { "<leader>fg", "<cmd>Telescope live_grep_args<cr>",       desc = "Live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",              desc = "Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",            desc = "Help tags" },
        { "<leader>pp", "<cmd>Telescope commands<cr>",             desc = "Commands" },
        { "gi",         "<cmd>Telescope coc implementations<cr>",  desc = "Implementations" },
        { "gr",         "<cmd>Telescope coc references<cr>",       desc = "References" },
        { "<leader>fo", "<cmd>Telescope coc document_symbols<cr>", desc = "Document symbols" },
        { "<C-]>",      "<cmd>Telescope coc definitions<cr>",      desc = "Definitions" },
    },
}
