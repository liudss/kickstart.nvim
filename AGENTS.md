# AGENTS.md

Guidelines for agentic coding agents working in this Neovim configuration repository.

## Project Overview

This is a kickstart.nvim-based Neovim configuration. It provides a well-documented starting point for Neovim configuration using Lua. The configuration uses lazy.nvim as the plugin manager.

## Build/Lint/Test Commands

### Installing/Updating Plugins

```bash
nvim --headless "+Lazy! sync" +qa
```

### Health Check

```bash
nvim --headless "+checkhealth" +qa
```

### No Tests

This is a configuration repository, not a library. There are no automated tests.

## Code Style Guidelines

### Formatting (stylua)

Configuration in `.stylua.toml`:

- Column width: 160 characters
- Indent: 2 spaces (not tabs)
- Quotes: Prefer single quotes
- Call parentheses: Omit when possible
- Collapse simple statements: Always

### Imports

```lua
local builtin = require 'telescope.builtin'
local lint = require 'lint'
```

- Use `require 'module'` without parentheses
- Prefer single quotes for strings
- Place imports at the top of functions or files

### Plugin Specification Pattern

Plugin files in `lua/kickstart/plugins/` return a LazySpec:

```lua
---@module 'lazy'
---@type LazySpec
return {
  'author/plugin-name',
  event = 'VimEnter',
  dependencies = { 'dep/plugin' },
  opts = {
    option = 'value',
  },
}
```

### Type Annotations

Use LuaCATS annotations for type safety:

```lua
---@module 'lazy'
---@type LazySpec

---@module 'telescope'
---@type telescope.Config

---@type table<string, vim.lsp.Config>
local servers = {}
```

### Plugin Configuration Styles

1. **Simple opts table** (preferred for straightforward setup):

```lua
{
  'plugin/name',
  opts = {
    setting = 'value',
  },
}
```

2. **Config function** (for complex configuration):

```lua
{
  'plugin/name',
  config = function()
    require('plugin').setup {
      setting = 'value',
    }
  end,
}
```

### Diagnostic Suppression

Use diagnostic disable comments for known missing fields in plugin specs:

```lua
---@diagnostic disable-next-line: missing-fields
opts = {
  nested = {
    field = 'value', ---@diagnostic disable-line: missing-fields
  },
},
```

### Autocommands

Use descriptive names and groups:

```lua
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('my-plugin-group', { clear = true }),
  desc = 'Description of what this does',
  callback = function(args)
    local buf = args.buf
  end,
})
```

### Keymaps

Include descriptions for which-key integration:

```lua
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
```

Use bracketed letters in descriptions to indicate the key: `[F]ind [F]iles`.

### Naming Conventions

- Variables/functions: `snake_case`
- Plugin module names: `plugin-name` (kebab-case)
- File names: `snake_case.lua`
- Augroup names: `plugin-purpose` (kebab-case)

### File Organization

- Main config: `init.lua`
- Plugin specs: `lua/kickstart/plugins/*.lua`
- Custom plugins: `lua/custom/plugins/*.lua`
- Each plugin file returns a LazySpec table

### Error Handling

- Use `pcall` for optional operations:

```lua
pcall(require('telescope').load_extension, 'fzf')
```

- Check modifiable before operations:

```lua
if vim.bo.modifiable then
  lint.try_lint()
end
```

### Comments

- Add file header comments explaining purpose:

```lua
-- Linting configuration using nvim-lint
-- https://github.com/mfussenegger/nvim-lint
```

- Use `-- NOTE:` for important information
- Use `-- TIP:` for helpful suggestions
- Use `-- WARN:` for caveats

### Conditional Logic

Platform-specific checks:

```lua
if vim.fn.has 'win32' == 1 then
  -- Windows-specific code
end

if vim.fn.executable 'make' == 1 then
  -- Only if make is available
end
```

### Plugin Manager

This config uses lazy.nvim. Key commands:

- `:Lazy` - Open plugin manager UI
- `:Lazy sync` - Sync plugins
- `:Lazy update` - Update plugins
- `:Lazy clean` - Remove unused plugins

### LSP Configuration

Servers are configured in `init.lua`:

```lua
local servers = {
  clangd = {},
  -- gopls = {},
  -- pyright = {},
}
```

Add LSP servers here, then Mason will auto-install them.

### Formatters

Configured via conform.nvim. Add formatters by filetype:

```lua
formatters_by_ft = {
  lua = { 'stylua' },
  python = { 'isort', 'black' },
},
```
