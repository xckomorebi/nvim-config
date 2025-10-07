return {
    "neoclide/coc.nvim",

    init = function()
        vim.g.coc_global_extensions = {
            "coc-go",
            "coc-json",
        }
    end,

    branch = "release",
}

