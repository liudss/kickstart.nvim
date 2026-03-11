-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursor.
      separator = nil,
      zindex = 20, -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    },
  },

  {
    'gutsavgupta/nvim-gemini-companion',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
    config = function()
      require('gemini').setup {
        -- You can customize your configuration here
        -- For example:
        -- cmds = { "gemini" },
      }
    end,
    keys = {
      { '<leader>gg', '<cmd>GeminiToggle<cr>', desc = 'Toggle Gemini sidebar' },
      { '<leader>gc', '<cmd>GeminiSwitchToCli<cr>', desc = 'Spawn or switch to AI session' },
      { '<leader>gs', '<cmd>GeminiSend<cr>', mode = { 'x' }, desc = 'Send selection to Gemini' },
    },
  },
}
