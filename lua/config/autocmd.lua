-- if vim.g.coc_global_extensions ~= nil then
--     vim.api.nvim_create_augroup("CocGroup", {})
--     vim.api.nvim_create_autocmd("CursorHold", {
--         group = "CocGroup",
--         command = "silent call CocActionAsync('highlight')",
--         desc = "Highlight symbol under cursor on CursorHold"
--     })
-- end

vim.api.nvim_create_augroup("General", {})
vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopePreviewerLoaded",
    callback = function()
        vim.opt_local.number = true
    end,
    group = "General",
    desc = "Enable Line Number in Telescope Preview",
})

-- if vim.g.coc_global_extensions ~= nil then
--     vim.api.nvim_create_autocmd("BufWritePre", {
--         pattern = { "*.go" },
--         group = "General",
--         callback = function()
--             vim.fn.CocAction("format")
--             vim.fn.CocAction("organizeImport")
--         end,
--         desc = "Organize imports and format document",
--     })
-- end

-- Create an autocmd group for LSP formatting
local lsp_format_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go" },
    group = lsp_format_augroup,
    callback = function()
        vim.lsp.buf.format()
        vim.lsp.buf.code_action { context = { only = { "source.organizeImports" } }, apply = true }
    end,
})
