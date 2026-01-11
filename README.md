# Modern Neovim Configuration

A feature-rich, modular Neovim configuration written in Lua with AI assistance, LSP support, and modern plugins.

## ✨ Features

- 🚀 **Fast startup** with lazy-loading via [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🤖 **AI Integration** with Claude Code and GitHub Copilot
- 📝 **LSP Support** for Go, Python, Lua, C/C++, and JSON
- 🎨 **Beautiful UI** with Sonokai theme, lualine, and noice.nvim
- 🔍 **Fuzzy Finding** with Telescope and git-aware file search
- 🌳 **File Explorer** with nvim-tree
- 📦 **Session Management** with auto-session
- 🔤 **Auto-completion** with nvim-cmp
- 🎯 **Syntax Highlighting** with Treesitter
- 💻 **Terminal Integration** with toggleterm

## 📋 Requirements

- Neovim >= 0.9.0
- Git
- A Nerd Font (for icons)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for Telescope)
- Language servers (install as needed):
  - `gopls` (Go)
  - `pyright` (Python)
  - `lua-language-server` (Lua)
  - `clangd` (C/C++)
  - `vscode-json-languageserver` (JSON)

## 🚀 Installation

1. **Backup your existing configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Install plugins**:
   - Plugins will automatically install on first launch
   - Or manually run `:Lazy sync`

5. **Install language servers**:
   - Most LSPs can be installed via Mason: `:Mason`
   - Or install them manually using your system package manager

## 🔑 Key Mappings


### Leader Keys
- **Global Leader**: `Space`
- **Local Leader**: `\`

### Core Mappings

| Mode | Mapping | Description |
|------|---------|-------------|
| Normal | `<C-->` / `<C-_>` | Go to previous location |
| Normal | `<A-F>` | Format code |
| Normal | `<A-O>` | Organize imports |
| Terminal | `<C-q>` | Exit terminal mode |

### Plugin-Specific Mappings

#### Claude Code (AI Assistant)
| Mapping | Description |
|---------|-------------|
| `<leader>aa` | Toggle Claude Code |
| `<leader>af` | Focus Claude Code |
| `<leader>ar` | Resume Claude Code |

#### Telescope (Fuzzy Finder)
Use `<leader>f` prefix for most Telescope commands (configured in `lua/plugins/telescope.lua`).

#### File Explorer
Check `lua/plugins/nvim-tree.lua` for nvim-tree keybindings.

## 📚 Plugin List

### AI & Completion
- **claudecode.nvim** - Claude AI assistant integration
- **copilot.vim** - GitHub Copilot integration
- **nvim-cmp** - Auto-completion engine
- **LuaSnip** - Snippet engine

### LSP & Syntax
- **lsp-zero.nvim** - LSP configuration helper
- **nvim-lspconfig** - LSP configurations
- **nvim-treesitter** - Syntax highlighting and parsing
- **treesitter-context** - Show code context at the top

### UI & Appearance
- **sonokai** - Color scheme
- **lualine.nvim** - Status line
- **noice.nvim** - Enhanced UI for messages and cmdline
- **nvim-tree.lua** - File explorer
- **which-key.nvim** - Show available keybindings

### Navigation & Search
- **telescope.nvim** - Fuzzy finder
- **harpoon** - Quick file navigation

### Git Integration
- **gitsigns.nvim** - Git decorations
- **vim-fugitive** - Git commands

### Utilities
- **auto-session** - Session management
- **toggleterm.nvim** - Terminal management
- **markdown-preview.nvim** - Preview markdown files
- **vim-sleuth** - Automatic indent detection
- **auto-pairs** - Auto-close brackets

## 🗂️ Project Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lazy-lock.json              # Plugin version lock file
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # Plugin manager setup
│   │   ├── opts.lua           # Neovim options
│   │   ├── remap.lua          # Key mappings
│   │   ├── autocmd.lua        # Auto-commands
│   │   ├── commands.lua       # Custom commands
│   │   └── vscode.lua         # VSCode-Neovim config
│   ├── plugins/               # Plugin configurations (one file per plugin)
│   │   ├── claude.lua         # Claude AI assistant
│   │   ├── copilot.lua        # GitHub Copilot
│   │   ├── telescope.lua      # Fuzzy finder
│   │   ├── treesitter.lua     # Syntax highlighting
│   │   └── ...
│   └── lsp/                   # LSP configurations
│       ├── init.lua           # LSP setup
│       ├── gopls.lua          # Go LSP
│       ├── pyright.lua        # Python LSP
│       ├── luals.lua          # Lua LSP
│       ├── clangd.lua         # C/C++ LSP
│       └── jsonls.lua         # JSON LSP
├── ftplugin/                  # File type specific settings
│   ├── go.lua                 # Go settings
│   ├── javascript.lua         # JavaScript settings
│   └── json.lua               # JSON settings
└── ftdetect/                  # File type detection
```

## 🎯 Language Support

### Go
- **LSP**: gopls
- **Features**: Auto-formatting on save, organize imports
- **Settings**: Tab indentation, custom listchars

### Python
- **LSP**: pyright
- **Features**: Type checking, auto-completion

### Lua
- **LSP**: lua-language-server
- **Features**: Neovim API support, diagnostics

### C/C++
- **LSP**: clangd
- **Features**: Code navigation, completion

### JSON
- **LSP**: vscode-json-languageserver
- **Features**: Schema validation, formatting
- **Settings**: 2-space indentation

### JavaScript
- **Settings**: 2-space indentation

## 🔧 Customization

### Adding a New Plugin

1. Create a new file in `lua/plugins/`:
   ```lua
   -- lua/plugins/my-plugin.lua
   return {
       "author/plugin-name",
       opts = {},
       config = function()
           -- Plugin configuration
       end
   }
   ```

2. Restart Neovim or run `:Lazy sync`

### Adding LSP Support

1. Create a configuration file in `lua/lsp/`:
   ```lua
   -- lua/lsp/my-lsp.lua
   return function()
       -- LSP-specific configuration
   end
   ```

2. Add the LSP to the enabled list in `lua/lsp/init.lua`:
   ```lua
   vim.lsp.enable({
       "gopls",
       "pyright",
       -- ... other LSPs
       "my-lsp",  -- Add your LSP here
   })
   ```

### Modifying Key Mappings

- **Core mappings**: Edit `lua/config/remap.lua`
- **Plugin mappings**: Edit the respective plugin file in `lua/plugins/`

### Changing Theme

Edit `lua/plugins/theme.lua` to change the color scheme.

## 📝 Notes

- Treesitter is disabled for files larger than 100KB for performance
- VSCode-specific configuration is available when using vscode-neovim
- Sessions automatically save/restore with nvim-tree closed
- Auto-formatting is enabled for Go files on save

## 🐛 Troubleshooting

### Plugins not loading
```vim
:Lazy sync
:Lazy clean
```

### LSP not working
1. Check if the language server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. View LSP logs: `:LspLog`

### Performance issues
- Check startup time: `nvim --startuptime startup.log`
- Profile plugins: `:Lazy profile`

## 📄 License

This configuration is provided as-is for personal use.

## 🙏 Acknowledgments

Built with:
- [lazy.nvim](https://github.com/folke/lazy.nvim) by folke
- [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) by VonHeikemen
- And many other amazing plugin authors!
