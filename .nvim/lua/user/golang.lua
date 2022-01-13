local options = {
  go_fmt_command                         = 'goimports',
  go_autodetect_gopath                   = 1,
  go_list_type                           = 'quickfix',
  go_template_autocreate                 = 0, -- disable auto fills the buffer content when a new file is created.
  go_textobj_enabled                     = 0, -- disable adds custom text objects.
  go_auto_type_info                      = 1, -- show the type info for the word under the cursor automatically.
  go_version_warning                     = 1,
  go_highlight_types                     = 1,
  go_highlight_fields                    = 1,
  go_highlight_functions                 = 1,
  go_highlight_function_calls            = 1,
  go_highlight_function_parameters       = 1,
  go_highlight_operators                 = 1,
  go_highlight_extra_types               = 1,
  go_highlight_methods                   = 1,
  go_highlight_generate_tags             = 1,
  go_highlight_space_tab_error           = 1, -- highlight instances of tabs following spaces.
  go_highlight_structs                   = 1,
  go_highlight_string_spellcheck         = 1,
  go_highlight_trailing_whitespace_error = 1,
  go_highlight_variable_assignments      = 0, -- disable highlight variable names in variable assignments.
  go_highlight_variable_declarations     = 0, -- disable highlight variable names in variable declarations.
  go_highlight_format_strings            = 1, -- highlight printf-style formatting verbs inside string literals.
  go_highlight_array_whitespace_error    = 1, -- highlight white space after [].
  go_highlight_build_constraints         = 1, -- highlight build constraints.
  go_echo_go_info                        = 0, -- disable show the identifier information when code completion is done.
  go_doc_popup_window                    = 1, -- use the popup-window for GoDoc, rather than the preview-window.
  go_def_mapping_enabled                 = 0, -- disable the default mapping of C-] and (gd) for GoDef.
  go_doc_keywordprg_enabled              = 0, -- disable run godoc on words under the cursor with K.
  godef_split                            = 2,
}

for k, v in pairs(options) do
  vim.g[k] = v
end

vim.cmd [[
  let g:go_debug_windows = {
    \ 'vars':       'rightbelow 60vnew',
    \ 'stack':      'rightbelow 10new',
    \ 'out':        'botright 10new',
  \ }
]]

