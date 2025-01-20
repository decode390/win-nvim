local map = vim.keymap

map.set('i', 'jk', '<ESC>')

map.set('n', 'o', 'o<ESC>')
map.set('n', 'O', 'O<ESC>')

map.set('n', '*', '*Nzz')
map.set('n', '#', '#Nzz')

map.set('n', '<C-q>', ':q<CR>')
map.set('n', '<leader>q', ':bd<CR>')

map.set('n', '<leader>e', ':NvimTreeToggle<CR>')
map.set('n', '<Tab>', ':bn<CR>')
map.set('n', '<S-Tab>', ':bp<CR>')

map.set('n', '<leader>p', '"0p')

local buf = require'vim.lsp.buf'
map.set('n', 'grn', buf.rename)
map.set('n', 'gra', buf.code_action)
map.set('n', 'grr', buf.references)
map.set('n', 'gri', buf.implementation)
map.set('n', 'gO', buf.document_symbol)
map.set('i', '<C-S>', buf.signature_help)
map.set('n', '<leader>.', vim.diagnostic.open_float)

map.set('n', '<leader>tn', '<CMD>:tabnew<CR>')
map.set('n', '<leader>tc', '<CMD>:tabclose<CR>')
