-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = '>',
        expander_expanded = 'v',
        expander_highlight = 'NeoTreeExpander',
      },
      icon = {
        folder_closed = '[D]',
        folder_open = '[D]',
        folder_empty = '[E]',
        default = '[F]',
      },
      name = {
        trailing_slash = true,
        use_git_status_colors = true,
      },
      git_status = {
        symbols = {
          -- Change type
          added = 'A',
          modified = 'M',
          deleted = 'D',
          renamed = 'R',
          -- Status type
          untracked = 'U',
          ignored = 'I',
          unstaged = 'S',
          staged = 'St',
          conflict = 'C',
        },
      },
    },
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
