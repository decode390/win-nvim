local map = vim.keymap

local function mapVscode(lhs, vscode_command)
  vim.api.nvim_set_keymap("n", lhs, ":call VSCodeNotify('" .. vscode_command .. "')<CR>", { noremap = true, silent = true })
end

-- Folding
--map.set('n', 'j', function() vim.cmd('silent! call VSCodeCall("cursorDown")') end, {silent = true})
--map.set('n', 'k', function() vim.cmd('silent! call VSCodeCall("cursorUp")') end, {silent = true})

mapVscode('za', 'editor.toggleFold')
mapVscode('<leader>e', 'workbench.view.explorer')

mapVscode('<leader>q', 'workbench.action.closeActiveEditor')


vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function() 
		local fileType = vim.bo.filetype
		
		if fileType == "cs" then
			mapVscode('<leader>tr', 'dotnet.test.runTestsInContext')
		else
			local existing_map = vim.fn.maparg('<leader>tr', 'n')
			if existing_map ~= "" then
				vim.keymap.del('n', '<leader>tr')
			end
		end
	end
})