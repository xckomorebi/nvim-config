--- @param config table
--- @param filename string
--- @return table
local function merge_local_config(config, filename)
    if filename == nil then
        return config
    end

    local chunk, err = loadfile(".vim/" .. filename)
    if err ~= nil then
        return config
    end

    if chunk == nil then
        return config
    end

    local local_config = chunk()
    return vim.tbl_deep_extend("force", config, local_config)
end

local global_config = {
    staticcheck = true,
    analyses = {
        modernize = false,
        ST1003 = false, -- abbreviations API vs Api
        ST1020 = false, -- comment on exported function
    }
}

vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
    root_markers = { "go.mod", "go.sum", ".git" },
    settings = {
        gopls = merge_local_config(global_config, "gopls.lua")
    }
})
