return {
    {
        "xckomorebi/neotest",
        branch = "fix/tbl-flatten-subprocess-nio",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neotest/nvim-nio",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-go",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-go")({
                        args = { "-count=1", "-timeout=60s" },
                    }),
                },
            })
        end,
        keys = {
            { "<leader>tt", function() require("neotest").run.run() end,                          desc = "Run nearest test" },
            { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,        desc = "Run test file" },
            { "<leader>ts", function() require("neotest").summary.toggle() end,                   desc = "Toggle test summary" },
            { "<leader>to", function() require("neotest").output.open({ enter = true }) end,      desc = "Open test output" },
            { "<leader>tO", function() require("neotest").output_panel.toggle() end,              desc = "Toggle output panel" },
            { "<leader>tS", function() require("neotest").run.stop() end,                         desc = "Stop tests" },
            { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end,      desc = "Debug nearest test" },
        },
    },
}
