return {
    "akinsho/toggleterm.nvim",
    opts = {
        open_mapping = "<leader>tt",
        insert_mappings = false,
        terminal_mappings = false,
        size = 15,

        -- nvim-tree
        on_open = function(terminal)
            local api = require("nvim-tree.api")
            local nvimtree_view = require("nvim-tree.view")
            if nvimtree_view.is_visible() and terminal.direction == "horizontal" then
                local nvimtree_width = vim.fn.winwidth(nvimtree_view.get_winnr())
                local original_width = nvimtree_view.View.width
                nvimtree_view.View.width = nvimtree_width
                api.tree.toggle({ focus = false })
                api.tree.toggle({ focus = false })
                nvimtree_view.View.width = original_width
            end
        end
    },
}
