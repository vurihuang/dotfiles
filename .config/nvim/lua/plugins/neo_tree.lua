return {
  "neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = false,
        hide_gitignored = true,
        hide_dotfiles = false,
        show_hidden_count = true,
        hide_by_name = { ".github" },
        never_show = { ".git" },
      },
    },
  },
}
