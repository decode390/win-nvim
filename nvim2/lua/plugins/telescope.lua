return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {{'nvim-lua/plenary.nvim', priority = 1000}},
  config = function() 

    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-h>"] = "which_key"
          }
        }
      }
    })

    local map = vim.keymap
    local builtin = require('telescope.builtin')
    map.set('n', '<leader>ff', builtin.find_files)
    map.set('n', '<leader>fg', builtin.live_grep)
    map.set('n', '<leader>fb', builtin.buffers)
    map.set('n', '<leader>fs', builtin.lsp_document_symbols)

  end,
}
