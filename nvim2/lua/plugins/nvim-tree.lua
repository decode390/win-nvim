return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {{ "nvim-tree/nvim-web-devicons", opts = {} }},
  config = function() 
    require('nvim-tree').setup({})
    require('nvim-web-devicons').setup({})
  end,

}
