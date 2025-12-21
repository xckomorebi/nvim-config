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
- **LSP manager**: lsp-zero.nvim
- **LSP directory**: `lua/lsp/` - each language server has its own configuration
- **Supported LSPs**: gopls, pyright, luals, clangd
- **Auto-formatting**: Enabled for Go files on save
- **Diagnostics**: Show on cursor hold

### AI Integration
- **Primary AI**: Claude Code (`claudecode.nvim`) - configured in `lua/plugins/claude.lua`
- **Key mappings**: `<leader>aa` to toggle, `<leader>af` to focus, `<leader>ar` to resume
- **Alternative**: Sidekick (currently disabled in `lua/plugins/sidekick.lua`)
- **Code completion**: GitHub Copilot (`lua/plugins/copilot.lua`)

## Common Development Tasks

### Adding a New Plugin
1. Create a new `.lua` file in `lua/plugins/` following the plugin configuration pattern
2. The plugin will be automatically loaded via `{ import = "plugins" }` in `lazy.lua:28`
3. Run `:Lazy sync` in Neovim to install the plugin

### Updating Plugins
- Run `:Lazy sync` in Neovim to update all plugins
- Plugin versions are locked in `lazy-lock.json`

### Configuring LSP for a New Language
1. Create a new configuration file in `lua/lsp/` (e.g., `rust.lua`)
2. Add the LSP server name to `vim.lsp.enable()` in `lua/lsp/init.lua:6-11`
3. The LSP will be automatically set up via lsp-zero.nvim

### Key Mapping Conventions
- Global leader is Space (` `)
- Local leader is backslash (`\`)
- Plugin-specific mappings are defined in each plugin's `keys` table
- Core mappings are in `lua/config/remap.lua`

## Important Configuration Details

### File Type Handling
- **Go**: Tabs instead of spaces, custom listchars (configured in `ftplugin/go.lua`)
- **General**: 4-space tabs, line numbers, smart case search
- **File type detection**: `ftdetect/` directory
- **File type plugins**: `ftplugin/` directory

### Performance Considerations
- Treesitter disabled for files >100KB
- Auto-install of missing parsers
- Lazy loading where possible

### Conditional Loading
- VSCode-specific configuration in `lua/config/vscode.lua` when `vim.g.vscode` is true
- Plugin-specific conditions (e.g., `enabled = false` for sidekick)

## Key File References

- `init.lua`: Main entry point
- `lua/config/lazy.lua`: Plugin manager setup
- `lua/plugins/claude.lua`: Claude Code AI assistant configuration
- `lua/plugins/telescope.lua`: Fuzzy finder with git-aware file search
- `lua/lsp/init.lua`: LSP setup and diagnostics
- `lua/lsp/gopls.lua`: Go language server configuration
- `ftplugin/go.lua`: Go-specific editor settings
- `lazy-lock.json`: Plugin version lock file

## Recent Changes (from git history)
- Added treesitter-context plugin for contextual code display
- Set filetype for Go skipped_tests.txt files
- Switched from sidekick to claudecode.nvim as primary AI assistant
- Configured gopls workspace folder merging
- Improved Copilot keybindings