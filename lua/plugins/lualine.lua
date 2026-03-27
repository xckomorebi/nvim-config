return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "edkolev/tmuxline.vim",
    },

    -- config = function(_, opts)
    --     local git_status = { staged = 0, unstaged = 0, new = 0, ahead = 0, behind = 0 }
    --
    --     local function update_git_status()
    --         vim.fn.jobstart("git status --porcelain 2>/dev/null", {
    --             stdout_buffered = true,
    --             on_stdout = function(_, data)
    --                 local staged, unstaged, new = 0, 0, 0
    --                 for _, line in ipairs(data or {}) do
    --                     if #line >= 2 then
    --                         local x, y = line:sub(1, 1), line:sub(2, 2)
    --                         if x ~= " " and x ~= "?" then staged = staged + 1 end
    --                         if y ~= " " and y ~= "?" then unstaged = unstaged + 1 end
    --                         if x == "?" and y == "?" then new = new + 1 end
    --                     end
    --                 end
    --                 git_status.staged = staged
    --                 git_status.unstaged = unstaged
    --                 git_status.new = new
    --             end,
    --         })
    --         vim.fn.jobstart("git rev-list --count HEAD..@{upstream} 2>/dev/null", {
    --             stdout_buffered = true,
    --             on_stdout = function(_, data)
    --                 git_status.behind = tonumber((data or {})[1]) or 0
    --             end,
    --         })
    --         vim.fn.jobstart("git rev-list --count @{upstream}..HEAD 2>/dev/null", {
    --             stdout_buffered = true,
    --             on_stdout = function(_, data)
    --                 git_status.ahead = tonumber((data or {})[1]) or 0
    --             end,
    --         })
    --     end
    --
    --     update_git_status()
    --     vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained", "ShellCmdPost" }, {
    --         callback = update_git_status,
    --     })
    --
    --     opts.sections.lualine_b = {
    --         {
    --             function()
    --                 local branch = vim.b.gitsigns_head or vim.fn.system("git branch --show-current 2>/dev/null"):gsub("\n", "")
    --                 if branch == "" then return "" end
    --                 local parts = { " " .. branch }
    --                 local sync = ""
    --                 if git_status.behind > 0 then sync = sync .. "⇣" .. git_status.behind end if git_status.ahead > 0 then sync = sync .. "⇡" .. git_status.ahead end
    --                 if sync ~= "" then table.insert(parts, sync) end
    --                 local s, u, n = git_status.staged, git_status.unstaged, git_status.new
    --                 if s > 0 then table.insert(parts, "+" .. s) end
    --                 if u > 0 then table.insert(parts, "!" .. u) end
    --                 if n > 0 then table.insert(parts, "?" .. n) end
    --                 return table.concat(parts, " ")
    --             end,
    --             color = function()
    --                 local s, u, n = git_status.staged, git_status.unstaged, git_status.new
    --                 if s > 0 or u > 0 then
    --                     return { fg = "#e0af68" }
    --                 end
    --                 return { fg = "#9ece6a" }
    --             end,
    --         },
    --     }
    --
    --     require("lualine").setup(opts)
    -- end,

    opts = {
        options = {
            globalstatus = true,
            disabled_filetypes = {
            },
        },

        sections = {
            lualine_x = {
                {
                    require("noice").api.status.command.get,
                    cond = require("noice").api.status.command.has,
                    color = { fg = "#ff9e64" },
                },
                {
                    require("noice").api.status.mode.get,
                    cond = require("noice").api.status.mode.has,
                    color = { fg = "#ff9e64" },
                }
            }
        }
    }
}
