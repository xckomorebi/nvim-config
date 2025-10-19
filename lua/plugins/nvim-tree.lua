local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

-- NOTE: File Explorer
return {
    "nvim-tree/nvim-tree.lua",
    keys = {
        { "<leader>b", "<cmd>NvimTreeToggle<cr>",   desc = "Toggle file explorer" },
        { "<leader>r", "<cmd>NvimTreeFindFile<cr>", desc = "Reveal file" },
    },

    lazy = false,

    cmd = {
        "NvimTreeOpen",
        "NvimTreeToggle",
        "NvimTreeFocus",
        "NvimTreeFindFile",
        "NvimTreeFindFileToggle",
    },
    opts = {
        on_attach = on_attach,
        disable_netrw = true,
        diagnostics = {
            enable = true,
            icons = {
                hint = "󰌵",
                info = "",
                warning = "",
                error = "",
            },
            show_on_dirs = true,
        },
        sync_root_with_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = false,
            ignore_list = {},
        },
        git = {
            enable = true,
            ignore = true,
            show_on_dirs = true,
            show_on_open_dirs = true,
            timeout = 5000,
        },
        view = {
            width = 35,
        },
        filters = {
            git_ignored = false,
        },
        renderer = {
            indent_markers = {
                enable = true
            },
            icons = {
                git_placement = "after",
                diagnostics_placement = "right_align",
                glyphs = {
                    default = "󰈚",
                    symlink = "",
                    folder = {
                        default = "",
                        empty = "",
                        empty_open = "",
                        open = "",
                        symlink = "",
                        symlink_open = "",
                        arrow_open = "",
                        arrow_closed = "",
                    },

                    git = {
                        unstaged = "",
                        staged = "✓",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "U",
                        deleted = "",
                        ignored = "◌",
                    },
                },
            },
        },
    },
}
