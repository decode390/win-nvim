vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)

  -- Required packer called imself
	use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'


  use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
          require("nvim-autopairs").setup {}
      end
  }


  -- Theme
	use ({
		'navarasu/onedark.nvim',
		config = function()
			require('onedark').setup{
				style = 'deep'
			}
			require('onedark').load()
		end,
	})

  use({
    'folke/tokyonight.nvim',
  })


  -- Navigation
	use ({
		'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
		config = function()
			require('nvim-tree').setup({
				view = {
					width = 40
				}
			})
      require('nvim-web-devicons').setup()
		end,
	})

  use ({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function() 
      require('lualine').setup()
    end,
  })


  use({
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    requires = {
      {'nvim-lua/plenary.nvim'}, 
      {'nvim-telescope/telescope-frecency.nvim'},
      {'tiagovla/scope.nvim'}
    },
    config = function()
      
      local telescope = require'telescope'
      telescope.setup({
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
       telescope.load_extension'frecency'
    end,
  })


  -- Completion
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      {'neovim/nvim-lspconfig'}, 
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'L3MON4D3/LuaSnip'},
      {'saadparwaiz1/cmp_luasnip'},
      {'rafamadriz/friendly-snippets'}
    },
    config = function() 
      require'plugins/cmp'
    end,
  })

  -- Language Server
  use({
    'neovim/nvim-lspconfig',
    config = function()
      require'plugins/lspconfig'
    end,
  })

  use({
    'folke/which-key.nvim',
    config = function()
      require'which-key'.setup{}
      --require'telescope'.load_extension('which_key')

    end,
  })

  use({
    'mfussenegger/nvim-dap',
    requires = {
      {'rcarriga/nvim-dap-ui'},
      {'nvim-neotest/nvim-nio'},
    },
    config = function() 
      local dap = require'dap'
      dap.adapters.coreclr = {
        type = 'executable',
        command = 'netcoredbg',
        args = {'--interpreter=vscode'}
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
              return vim.fn.input('Path to dll', vim.fn.getcwd() .. '\\bin\\Debug\\', 'file')
          end,
          env = {
            ASPNETCORE_ENVIRONMENT='Development',
            ASPNETCORE_URLS='https://localhost:7229'
          },
        },
      }

      require'dapui'.setup()

    end,
  })

  use({
    'lewis6991/gitsigns.nvim',
    config = function() 
      require('gitsigns').setup()
    end,
  })

  use({
    'tpope/vim-fugitive',
    config = function()
    end,
  })

  use({
    'nanozuki/tabby.nvim',
    requires = {{'nvim-tree/nvim-web-devicons'}},
    config = function()
      require('tabby').setup()
    end,
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function() 
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = function() 
      require('nvim-treesitter.configs').setup({
        ensure_installed = {'lua', 'c_sharp'},
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        },
        indent = {
          enable = true
        },
      })

      vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
        group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
        callback = function()
          vim.opt.foldmethod     = 'expr'
          vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
        end
      })
    end,


  })

end)
