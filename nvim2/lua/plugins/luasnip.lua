return {
  'L3MON4D3/LuaSnip',
  priority = 90,
  config = function() 

    -- Load and configure luasnip (Using friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    local map = vim.keymap
    local ls = require('luasnip')
    --map.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
    map.set({"i", "s"}, "<C-L>", function() ls.jump(1) end, {silent = true})
    map.set({"i", "s"}, "<C-H>", function() ls.jump(-1) end, {silent = true})
  end,
}
