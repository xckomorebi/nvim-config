return {
    "itchyny/lightline.vim",

    dependencies = {
        "edkolev/tmuxline.vim",
    },

    init = function()
        vim.g.lightline = {
            colorscheme = "materia",
            active = {
                left = {
                    { "mode",      "paste" },
                    { "gitbranch", "readonly", "filename", "modified" }
                },
            },
            component_function = {
                gitbranch = "FugitiveHead"
            },
        }
    end,
}
