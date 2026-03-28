return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local luasnip = require("luasnip")

        -- Load VSCode-style snippets from friendly-snippets and any local snippets
        require("luasnip.loaders.from_vscode").lazy_load( { paths = vim.fn.getcwd() .. "/.vscode" } )
        -- Load lua-style snippets from ~/.config/nvim/snippets/
        require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })

        luasnip.config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",
            enable_autosnippets = true,
        })
    end,
}
