local telescope = require('telescope')
local lga_actions = require('telescope-live-grep-args.actions')

telescope.setup {
  extensions = {
    coc = {},
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          ["<C-space>"] = lga_actions.to_fuzzy_refine,
        },
      },
    },
  }
}

telescope.load_extension('coc')
telescope.load_extension('live_grep_args')
