-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("i", "jk", "<ESC>", { desc = "" })

--map("n", "<leader>/", '<cmd>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$', { desc = "Comment" })
map("n", "<C-h>", "<nop>")
map("n", "<C-j>", "<nop>")
map("n", "<C-k>", "<nop>")
map("n", "<C-l>", "<nop>")

-- file/find
map("n", "<leader>fl", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save file" })

-- windows
map("n", "<leader>wh", "<C-w>h", { desc = "Go to left window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to right window" })

-- tabs/Telescope
map("n", "<leader>tp", "<cmd>bp<cr>", { desc = "Previous tab" })
map("n", "<leader>tn", "<cmd>bn<cr>", { desc = "Next tab" })
map("n", "<leader>tl", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
-- map("n", "<leader>to", '<cmd>exe "tabn ".g:lasttab<cr>', { desc = "Switch to last tab" })
map("n", "<leader>tN", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "<leader>tt", "<cmd>Telescope<cr>", { desc = "Telescope" })
map("n", "<leader>td", "<cmd>tabclose<cr>", { desc = "Close tab" })

-- lsp
map(
  "n",
  "<leader>lv",
  '<cmd>lua require("goto-preview").goto_preview_definition()<cr>',
  { desc = "Preview definition" }
)
map("n", "<leader>lV", '<cmd>lua require("goto-preview").close_all_win()<cr>', { desc = "Close all preview wins" })
map("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Definition" })
map("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", { desc = "References" })
map("n", "<leader>lR", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "References pinned" })

--map("n", ";", ":", { desc = "" })
