vim.api.nvim_create_user_command("ToggleSonoakiTransparency", function()
    if vim.g.sonokai_transparent_background == 1 then
        vim.g.sonokai_transparent_background = 0
    else
        vim.g.sonokai_transparent_background = 1
    end

    vim.cmd.colorscheme("sonokai")
end, {})
