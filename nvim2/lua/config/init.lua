vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.g.vscode then
	require('config/vscode')
else
	require('config/lazy')
end

require('config/keybinds')
require('config/settings')