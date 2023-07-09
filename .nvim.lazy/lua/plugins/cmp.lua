local M = {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
  },
  opts = function()
    local cmp = require("cmp")
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local luasnip = require("luasnip")

    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = function(_, item)
          local icons = require("lazyvim.config").icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          return item
        end,
      },
      experimental = {
        ghost_text = {
          hl_group = "LspCodeLens",
        },
      },
    }
  end,
}

-- local M = {
--   "hrsh7th/nvim-cmp",
--   event = "InsertEnter",
--   enabled = true,
--   dependencies = {
--     "hrsh7th/cmp-nvim-lsp",
--     "hrsh7th/cmp-buffer",
--     "hrsh7th/cmp-path",
--   },
--   opts = function(_, opts)
--     local has_words_before = function()
--       unpack = unpack or table.unpack
--       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--     end
--
--     local luasnip = require("luasnip")
--     local cmp = require("cmp")
--
--     opts.mapping = vim.tbl_extend("force", opts.mapping, {
--       ["<Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_next_item()
--           -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
--           -- they way you will only jump inside the snippet region
--         elseif luasnip.expand_or_jumpable() then
--           luasnip.expand_or_jump()
--         elseif has_words_before() then
--           cmp.complete()
--         else
--           fallback()
--         end
--       end, { "i", "s" }),
--       ["<S-Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_prev_item()
--         elseif luasnip.jumpable(-1) then
--           luasnip.jump(-1)
--         else
--           fallback()
--         end
--       end, { "i", "s" }),
--     })
--
--     opts.mapping = vim.tbl_extend("force", opts.formatting, {
--       fields = { "kind", "abbr", "menu" },
--       format = function(entry, vim_item)
--         local lspkind_icons = {
--           Text = "",
--           Method = "",
--           Function = "",
--           Constructor = "",
--           Field = "ﰠ",
--           Variable = "",
--           Class = "ﴯ",
--           Interface = "",
--           Module = "",
--           Property = "ﰠ",
--           Unit = "塞",
--           Value = "",
--           Enum = "",
--           Keyword = "",
--           Snippet = "",
--           Color = "",
--           File = "",
--           Reference = "",
--           Folder = "",
--           EnumMember = "",
--           Constant = "",
--           Struct = "פּ",
--           Event = "",
--           Operator = "",
--           TypeParameter = " ",
--           Robot = "ﮧ",
--           Smiley = "ﲃ",
--           Note = " ",
--         }
--         local meta_type = vim_item.kind
--         -- load lspkind icons
--         vim_item.kind = lspkind_icons[vim_item.kind] .. ""
--         if entry.source.name == "cmp_tabnine" then
--           vim_item.kind = lspkind_icons["Robot"]
--           -- vim_item.kind_hl_group = "CmpItemKindTabnine"
--         end
--
--         if entry.source.name == "emoji" then
--           vim_item.kind = lspkind_icons["Smiley"]
--           vim_item.kind_hl_group = "CmpItemKindEmoji"
--         end
--
--         if entry.source.name == "look" then
--           vim_item.kind = lspkind_icons["Note"]
--           -- vim_item.kind_hl_group = "CmpItemKindEmoji"
--         end
--         vim_item.menu = ({
--           buffer = "[Buffer]",
--           nvim_lsp = meta_type,
--           path = "[Path]",
--           luasnip = "[LuaSnip]",
--           cmp_tabnine = "[TN]",
--           emoji = "[Emoji]",
--           look = "[Dict]",
--         })[entry.source.name]
--
--         return vim_item
--       end,
--     })
--   end,
-- }
--
return M
