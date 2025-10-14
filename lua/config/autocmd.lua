vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

vim.api.nvim_create_augroup("General", {})
vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function()
    vim.opt_local.number = true
  end,
  group = "General",
  desc = "Enable Line Number in Telescope Preview",
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go" },
    group = "General",
    callback = function()
        vim.fn.CocAction("format")
        vim.fn.CocAction("organizeImport")
    end,
    desc = "Organize imports and format document",
})
