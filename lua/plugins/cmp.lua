return {
    "VonHeikemen/lsp-zero.nvim",

    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
    },

    config = function()
        local cmp = require("cmp")
        local cmp_action = require("lsp-zero").cmp_action()
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        -- `:` cmdline setup.
        cmp.setup.cmdline(":", {
            preselect = cmp.PreselectMode.Item,
            mapping = cmp.mapping.preset.cmdline({
                ["<Tab>"] = { c = cmp.mapping.confirm({ select = true }) },
            }),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } },
            }),
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip", keyword_length = 2 },
                { name = "buffer",  keyword_length = 3 },
                { name = "path" },
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    local luasnip = require("luasnip")
                    if luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    elseif cmp.visible() then
                        cmp.confirm({ select = true })
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    local luasnip = require("luasnip")
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    elseif cmp.visible() then
                        cmp.select_prev_item(cmp_select)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
        })
    end
}
