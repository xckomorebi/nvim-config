vim.opt_local.expandtab = true

-- Detect indent size: scan first 100 lines for leading spaces, default to 2
local function detect_indent()
    local has_indent = false
    for i = 1, math.min(100, vim.api.nvim_buf_line_count(0)) do
        local line = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1] or ""
        local spaces = line:match("^( +)")
        if spaces then
            has_indent = true
            local n = #spaces
            if n % 4 ~= 0 then
                return 2
            end
        end
    end
    if has_indent then
        return 4
    end
    return 2
end

local indent = detect_indent()
vim.opt_local.shiftwidth = indent
vim.opt_local.tabstop = indent
vim.opt_local.softtabstop = indent

vim.opt_local.listchars = {
    leadmultispace = "▏" .. (" "):rep(indent - 1)
}
