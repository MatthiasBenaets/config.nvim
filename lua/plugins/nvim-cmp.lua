-- Code completion
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Load vscode snippets from dependencies
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Configuration
    cmp.setup({
      -- Popup menu for options with preview
      completion = {
        completeopt = "menu,menuone,preview,noinsert",
      },
      -- Cmp interact with Luasnip
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- Keymaps
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scoll docs down
        ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll docs up
        ["<C-Space>"] = cmp.mapping.complete(), -- Show cmp suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- Close suggestions
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm selected suggestion
      }),
      -- Suggestion sources
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP
        { name = "luasnip" }, -- Snippets
        { name = "buffer" }, -- Text in buffer
        { name = "path" }, -- File path
      }),
      -- Labels
      formatting = {
        format = function(entry, vim_item)
          local source_names = {
            nvim_lsp = "[LSP]",
            luasnip = "[SNIP]",
            buffer = "[BUF]",
            path = "[PATH]",
          }
          vim_item.menu = source_names[entry.source.name] or ""
          return vim_item
        end,
      },
    })
  end,
}
