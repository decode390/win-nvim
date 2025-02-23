if vim.g.vscode then
	require('config/keybinds/vscode')
else
	require('config/keybinds/native')
end

require('config/keybinds/common')