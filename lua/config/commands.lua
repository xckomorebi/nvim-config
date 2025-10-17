vim.api.nvim_create_user_command("ToggleSonoakiTransparency", function()
    if vim.g.sonokai_transparent_background == 1 then
        vim.g.sonokai_transparent_background = 0
    else
        vim.g.sonokai_transparent_background = 1
    end

    vim.cmd.colorscheme("sonokai")
end, {})

vim.api.nvim_create_user_command("DeleteAllOtherBuffers", function()
    local current_buf = vim.api.nvim_get_current_buf()
    local buffers = vim.api.nvim_list_bufs()
    local skip_filetyupes = {
        "NvimTree",
        "qf"
    }

    for _, buf in ipairs(buffers) do
        if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
            local filetype = vim.bo[buf].filetype

            if vim.tbl_contains(skip_filetyupes, filetype) then
                -- skip certain filetypes
            elseif vim.bo[buf].modified then
                local full_path = vim.api.nvim_buf_get_name(buf)
                local relative_path = vim.fn.fnamemodify(full_path, ':.')
                print("Buffer " .. relative_path .. " has unsaved changes. Skipping.")
            else
                vim.api.nvim_buf_delete(buf, {})
            end
        end
    end
end, {})
