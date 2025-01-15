local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },

  window = {
    completion = cmp.config.window.bordered(),
  },

  mapping = cmp.mapping.preset.insert({
--          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--          ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-i>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<C-j>'] = cmp.mapping(function (fallback)
      if cmp.visible()  then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ["<C-k>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

  }),

  sources = cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
    {name = 'buffer'}
  })
})

require("luasnip.loaders.from_vscode").lazy_load()
