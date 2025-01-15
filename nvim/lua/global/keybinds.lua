local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

-- Fix * and # (Keep the cursor position, don't move to next match)
map('n', '*', '*N')
map('n', '#', '#N')

-- Quit of normal and command
map({'i', 'c'}, 'jk', '<esc>')

-- Search and keep on middle of view
map({'n'}, 'n', 'nzz')
map({'n'}, 'N', 'Nzz')

-- New line keep on normal mode
map({'n'}, 'o', 'o<esc>')
map({'n'}, 'O', 'O<esc>')

-- Shortcut to yank register
map({ 'n', 'x' }, '<leader>p', '"0p')

-- Copying the vscode behaviour of making tab splits
map('n', '<C-\\>', '<CMD>vsplit<CR>')
map('n', '<A-\\>', '<CMD>split<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

-- Quit neovim
map('n', '<C-Q>', '<CMD>q<CR>')

-- Mimic shell movements
--map('i', '<M-E>', '<esc>A')
--map('i', '<M-A>', '<esc>I')

-- Buffers
-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

map('n', '<TAB>', '<CMD>bnext<CR>')
map('n', '<S-TAB>', '<CMD>bprev<CR>')
map('n', '<leader>q', '<CMD>bdelete<CR>')


-- Movement keep on middle of window
map('n', '<c-d>', '<c-d>zz')
map('n', '<c-u>', '<c-u>zz')

-- Navigation
map('n', '<leader>e', '<CMD>:NvimTreeToggle<CR>')
map('n', '<leader>tn', '<CMD>:tabnew<CR>')
map('n', '<leader>tc', '<CMD>:tabclose<CR>')
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files)
map('n', '<leader>fr', '<CMD>:Telescope frecency<CR>')
map('n', '<leader>fg', builtin.live_grep)
map('n', '<leader>fb', builtin.buffers)
map('n', '<leader>fh', builtin.help_tags)


-- Lsp
local buf = require'vim.lsp.buf'
map('n', 'grn', buf.rename)
map('n', 'gra', buf.code_action)
map('n', 'grr', buf.references)
map('n', 'gri', buf.implementation)
map('n', 'gO', buf.document_symbol)
map('i', '<C-S>', buf.signature_help)
map('n', '<leader>.', vim.diagnostic.open_float)

local ls = require'luasnip'
map({'i', 's'}, '<C-L>', function() ls.jump(1) end, {silent = true})
map({'i', 's'}, '<C-H>', function() ls.jump(-1) end, {silent = true})

-- Debugging
local ndap = require'dap'
local ndapui = require'dapui'
map('n', '<leader>b', ndap.toggle_breakpoint)
map('n', '<F5>', ndap.continue)
map('n', '<F10>', ndap.step_over)
map('n', '<F11>', ndap.step_into)
map('n', '<F12>', ndap.step_out)
-- map('n', '<F11>', dap.restart)
map('n', '<leader>dt', ndapui.toggle)
map('n', '<leader>di', function() ndapui.eval(nil, {enter = true}) end)
map('n', '<leader>ds', ndapui.toggle)
map('n', '<leader>do', ndap.repl.open)
map('n', '<leader>dl', ndap.run_last)

