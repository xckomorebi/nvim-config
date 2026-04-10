# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a modern Neovim configuration written in Lua, using lazy.nvim as the plugin manager. The configuration is modular with clear separation between core settings, plugin configurations, and language server setup.

## Architecture

### Entry Points
- `init.lua`: Main entry point, loads VSCode-specific config or full Neovim config
- `lua/config/lazy.lua`: Bootstrap lazy.nvim plugin manager
- `lua/config/opts.lua`: Neovim options and settings
- `lua/config/remap.lua`: Key mappings
- `lua/config/autocmd.lua`: Auto-commands and LSP formatting
- `lua/config/commands.lua`: Custom user commands

### Plugin Management
- **Plugin manager**: lazy.nvim (folke/lazy.nvim)
- **Plugin directory**: `lua/plugins/` - each plugin has its own `.lua` file
- **Lock file**: `lazy-lock.json` tracks exact plugin versions
- **Leader keys**: Space (` `) as global leader, backslash (`\`) as local leader

### Plugin Configuration Pattern
Each plugin file in `lua/plugins/` follows this structure:
```lua
return {
    "author/plugin-name",
    dependencies = { ... },
    opts = { ... },
    config = function() ... end,
    keys = { ... }
}
```

### Language Server Protocol
- **LSP setup**: Native Neovim 0.10+ API via `vim.lsp.enable()` in `lua/lsp/init.lua`
- **LSP directory**: `lua/lsp/` - each language server has its own configuration file
- **Supported LSPs**: gopls, pyright, luals, clangd, jsonls, ts_ls
- **Auto-formatting**: Go files run organize-imports + format on save (`BufWritePre`)
- **Diagnostics**: Show floating window on `CursorHold` (configured in `lua/config/autocmd.lua`)

### AI Integration
- **Primary AI**: Claude Code (`claudecode.nvim`) - configured in `lua/plugins/claude.lua`
- **Key mappings**: `<leader>aa` to toggle, `<leader>af` to focus, `<leader>at` to send selection (visual)
- **Alternative**: Sidekick (currently disabled in `lua/plugins/sidekick.lua`)
- **Code completion**: GitHub Copilot (`lua/plugins/copilot.lua`)

## Key Mapping Conventions
- Global leader is Space (` `)
- Local leader is backslash (`\`)
- Plugin-specific mappings are defined in each plugin's `keys` table
- Core mappings are in `lua/config/remap.lua`
- `<A-F>`: LSP format, `<A-O>`: LSP organize imports
- `<C-->` / `<C-_>`: Go to previous jump location (`<C-o>`)
- `<leader>tu`: Toggle Sonokai theme transparency

### Telescope Key Mappings
- `<leader>fp/fP`: Find files / git-aware find
- `<leader>fg`: Live grep (with args support)
- `<leader>fs/fb/fd/fk`: Git status / Buffers / Diagnostics / Keymaps
- `<C-]>`: LSP go-to-definition, `grr/gri/grt/gO`: LSP references/implementations/types/symbols

## Custom Commands
- `:ToggleSonokaiTransparency`: Toggle background transparency for the sonokai theme
- `:DeleteAllOtherBuffers`: Close all buffers except current (skips NvimTree, toggleterm, Claude terminals, and unsaved buffers)

## Important Configuration Details

### File Type Handling
- **Go**: Tabs instead of spaces, custom listchars (configured in `ftplugin/go.lua`)
- **General**: 4-space tabs, line numbers, smart case search
- **File type detection**: `ftdetect/` directory
- **File type plugins**: `ftplugin/` directory

### Notable Behaviors
- `autoread` is enabled with a 1-second polling timer (`checktime`) so external file changes are auto-detected
- VSCode-specific configuration in `lua/config/vscode.lua` when `vim.g.vscode` is true

### Performance Considerations
- Treesitter disabled for files >100KB
- Auto-install of missing parsers
- Lazy loading where possible

### Adding a New Plugin
1. Create a new `.lua` file in `lua/plugins/` following the plugin configuration pattern
2. The plugin will be automatically loaded via `{ import = "plugins" }` in `lazy.lua`
3. Run `:Lazy sync` in Neovim to install the plugin

### Configuring LSP for a New Language
1. Create a new configuration file in `lua/lsp/` (e.g., `rust.lua`)
2. Add the LSP server name to `vim.lsp.enable()` in `lua/lsp/init.lua`
