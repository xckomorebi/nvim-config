return {
    { "tpope/vim-fugitive" },
    {
        "tanvirtin/vgit.nvim",
        event = "VimEnter",
        config = function()
            require("vgit").setup({
                keymaps = {
                    ["n [c"] = "hunk_up",
                    ["n ]c"] = "hunk_down",
                    ["n <leader>gb"] = "buffer_blame_preview",
                    ["n <leader>hp"] = "buffer_hunk_preview",
                    ["n <leader>gp"] = "buffer_diff_preview",
                    ["n <leader>gd"] = "project_diff_preview",
                },
                settings = {
                    hls = {
                        GitCount = 'Keyword',
                        GitSymbol = 'CursorLineNr',
                        GitTitle = 'Directory',
                        GitSelected = 'QuickfixLine',
                        GitBackground = 'Normal',
                        GitAppBar = 'StatusLine',
                        GitHeader = 'NormalFloat',
                        GitFooter = 'NormalFloat',
                        GitBorder = 'LineNr',
                        GitLineNr = 'LineNr',
                        GitComment = 'Comment',
                        GitConflictCurrentMark = 'DiffAdd',
                        GitConflictAncestorMark = 'Visual',
                        GitConflictIncomingMark = 'DiffChange',
                        GitConflictCurrent = 'DiffAdd',
                        GitConflictAncestor = 'Visual',
                        GitConflictMiddle = 'Visual',
                        GitConflictIncoming = 'DiffChange',
                    },
                    scene = {
                        diff_preference = 'split',
                        keymaps = {
                            quit = 'q'
                        }
                    },
                },
            })
        end
    },
}
