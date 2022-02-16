-- highlight BookmarkSign ctermbg=NONE ctermfg=160
-- highlight BookmarkLine ctermbg=194 ctermfg=NONE

local opts = {
  bookmark_sign                    = "",
  bookmark_no_default_key_mappings = 1,
  bookmark_auto_save               = 1,
  bookmark_auto_close              = 0,
  bookmark_manage_per_buffer       = 0,
  bookmark_save_per_working_dir    = 0,
  bookmark_highlight_lines         = 1,
  bookmark_show_warning            = 0,
  bookmark_center                  = 1,
  bookmark_location_list           = 0,
  bookmark_disable_ctrlp           = 1,
  bookmark_display_annotation      = 0,
  bookmark_auto_save_file          = os.getenv('HOME') .. '/dotfiles/.nvim/.bookmarks',
}

for k, v in pairs(opts) do
  vim.g[k] = v
end

