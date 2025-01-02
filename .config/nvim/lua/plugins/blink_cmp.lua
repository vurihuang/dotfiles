return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        accept = {
          -- experimental auto-brackets support
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        list = {
          selection = "auto_insert",
        },
      },
      keymap = {
        preset = "enter",
        ["<TAB>"] = { "select_next", "snippet_forward", "fallback" },
      },
    },
    --   opts = {
    --     completion = {
    --       menu = {
    --         auto_show = true,
    --       },
    --     },
    --   },
    --   keymap = {
    --     preset = "super-tab",
    --     -- ["<TAB>"] = { "select_next", "snippet_forward", "fallback" },
    --     -- ["<C-y>"] = { "select_and_accept" },
    --   },
    --   completion = {
    --     list =
    --   }
    --   -- opts = {
    --   --   keymap = {
    --   --     preset = "super-tab",
    --   --     -- ["<C-space>"] = { "show", "show_documention", "hide_documention" },
    --   --     -- ["<Tab>"] = {
    --   --     --   "select_next",
    --   --     --   "snippet_forward",
    --   --     --   "fallback",
    --   --     -- },
    --   --     -- ["<S-Tab>"] = {
    --   --     --   "select_prev",
    --   --     --   "snippet_backward",
    --   --     --   "fallback",
    --   --     -- },
    --   --   },
    --   --   completion = {
    --   --     selection = "auto_insert",
    --   --     menu = {
    --   --       auto_show = true,
    --   --     },
    --   --   },
    --   -- },
    -- },
  },
}
