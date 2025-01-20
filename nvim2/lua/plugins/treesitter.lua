return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {"c_sharp"},
      highlight = {
        enable = true
      }
    })
  end
}
