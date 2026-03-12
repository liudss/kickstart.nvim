# Gemini Context: Neovim Configuration (kickstart.nvim)

This directory contains a Neovim configuration based on **kickstart.nvim**. It is designed as a minimal, documented starting point for a personal Neovim setup, rather than a full-blown distribution.

## Project Overview

- **Purpose:** A "kickstart" for Neovim configuration, providing essential IDE-like features while remaining easy to understand and modify.
- **Core Technologies:**
    - **Neovim:** (v0.10+ recommended) The text editor.
    - **Lua:** The language used for configuration.
    - **lazy.nvim:** Plugin manager.
    - **Mason.nvim:** Manager for LSP servers, DAP servers, linters, and formatters.
    - **Telescope.nvim:** Fuzzy finder for files, LSP symbols, etc.
    - **Treesitter:** Incremental parsing system for better syntax highlighting and code navigation.
    - **blink.cmp:** Modern, fast autocompletion engine.
    - **Conform.nvim:** Formatter plugin.
    - **mini.nvim:** Collection of various small Lua modules for common tasks.

## Directory Structure

- `init.lua`: The main entry point and core configuration. It handles options, keymaps, autocommands, and plugin setup.
- `lua/kickstart/`: Contains optional modular configurations provided by the kickstart template.
    - `plugins/*.lua`: Pre-configured sets for debugging (DAP), linting, indentation lines, etc.
    - `health.lua`: Custom `:checkhealth` provider for the configuration.
- `lua/custom/`: Reserved for user-specific customizations.
    - `plugins/*.lua`: User-defined plugin specifications.
- `doc/kickstart.txt`: Help documentation for the project.
- `.stylua.toml`: Configuration for the `stylua` Lua formatter.

## Key Commands

- `nvim`: Start Neovim.
- `:Lazy`: Open the plugin manager UI to update or manage plugins.
- `:Mason`: Open the Mason UI to install or manage LSP/DAP/Linter/Formatter tools.
- `:checkhealth`: Run Neovim's health check (includes kickstart-specific checks).
- `<leader>sf`: Search files (using Telescope).
- `<leader>sg`: Live grep (using Telescope).
- `<leader>sh`: Search help documentation.
- `<leader>f`: Format current buffer (using Conform).

## Development Conventions

- **Leader Key:** The `<space>` key is mapped as the leader and local leader.
- **Formatting:** Lua code should be formatted using `stylua` following the project's `.stylua.toml` settings.
- **Plugin Management:** Plugins are managed in `init.lua` using `lazy.nvim`. For modularity, add new plugin specs to `lua/custom/plugins/`.
- **LSP Configuration:** LSP servers are configured in `init.lua` and installed via `Mason`.

## External Dependencies

The following external tools are required or highly recommended:
- `git`, `make`, `unzip`, C compiler (`gcc`)
- `ripgrep` (for Telescope grep)
- `fd` (for Telescope find files)
- `tree-sitter CLI` (for Treesitter parsers)
- A **Nerd Font** (optional, for icons; set `vim.g.have_nerd_font = true` in `init.lua` if installed).
