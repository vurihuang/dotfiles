return {
  "folke/zen-mode.nvim",
  opts = {
    setup = {
      window = {
        backdrop = 1,
        height = 0.9, -- height of the Zen window
        width = 0.85,
        options = {
          signcolumn = "no", -- disable signcolumn
          number = true, -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = true, -- disable cursorline
          -- cursorcolumn = true, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
      plugins = {
        gitsigns = { enabled = true }, -- disables git signs
        tmux = { enabled = false },
        twilight = { enabled = true },
      },
    },
  },
}
