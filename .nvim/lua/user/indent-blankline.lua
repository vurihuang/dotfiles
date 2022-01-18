local status_ok, ib = pcall(require, 'idet-blankline')
if not status_ok then
  return
end

vim.g.indent_blankline_char                           = "│"
vim.g.indent_blankline_show_first_indent_level        = true
vim.g.indent_blankline_filetype_exclude               = {
  "alpha",
  "startify",
  "dashboard",
  "dotooagenda",
  "log",
  "fugitive",
  "gitcommit",
  "packer",
  "vimwiki",
  "markdown",
  "json",
  "txt",
  "vista",
  "help",
  "todoist",
  "NvimTree",
  "peekaboo",
  "git",
  "TelescopePrompt",
  "undotree",
  "flutterToolsOutline",
  "" -- for all buffers without a file type
}
vim.g.indent_blankline_buftype_exclude                = {"terminal", "nofile"}
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_current_context           = true
vim.g.indent_blankline_context_patterns               = {
  "class",
  "function",
  "method",
  "block",
  "list_literal",
  "selector",
  "^if",
  "^table",
  "if_statement",
  "while",
  "for"
}
vim.opt.termguicolors                                 = true

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

ib.setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}

-- because lazy load indent-blankline so need readd this autocmd
vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
