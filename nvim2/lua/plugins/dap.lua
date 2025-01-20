return { 'mfussenegger/nvim-dap',
  dependencies = {'ldelossa/nvim-dap-projects'},
  config = function()
    local dap = require('dap')
    require('nvim-dap-projects').search_project_config()

    local map = vim.keymap
    map.set('n', '<leader>b', dap.toggle_breakpoint)
    map.set('n', '<F5>', dap.continue)
    map.set('n', '<S-F5>', dap.stop)
    map.set('n', '<F10>', dap.step_over)
    map.set('n', '<F11>', dap.step_into)
    map.set('n', '<S-F11>', dap.step_out)
    map.set('n', '<leader>dl', dap.run_last)
    map.set('n', '<leader>dr', dap.repl.toggle)
    map.set('n', '<leader>ds', dap.terminate)

  end
}
