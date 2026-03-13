return {
  'lervag/vimtex',
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = 'general'
    vim.g.vimtex_view_general_viewer = 'SumatraPDF'
    vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

    vim.g.vimtex_indent_enabled = 0

    vim.g.vimtex_compiler_method = 'latexmk'
  end,
}
