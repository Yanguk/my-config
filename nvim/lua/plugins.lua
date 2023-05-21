vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup({function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  ------- lsp, cmp
  use({
    'neovim/nvim-lspconfig',
    requires = {
      {
        'hrsh7th/cmp-nvim-lsp',
        config = function ()
          require('plugins.cmp-nvim')
        end
      },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/vim-vsnip' },
    },
    config = function()
      require('plugins.lsp')
    end,
  })

  use 'tpope/vim-fugitive'

  use 'editorconfig/editorconfig-vim'

  use 'terryma/vim-multiple-cursors'

  use ({
    'simrat39/rust-tools.nvim',
    config = function()
      require('plugins.rust-tools')
    end
  })

	use {
    {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require('plugins.treesitter')
      end
    },
    {
      'windwp/nvim-ts-autotag',
      after = 'nvim-treesitter',
    }
  }

  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use ({
    'terrortylor/nvim-comment',
    config = function()
      require('plugins.nvim-comment')
    end
  })

  -- indent
  use ({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.indent-blankline')
    end
  })

  use({
    'gbprod/yanky.nvim',
    config = function()
      require('plugins.yanky')
    end
  })

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    after = 'github-nvim-theme',
    config = function()
      require('lualine').setup({
        options = {
          theme = 'auto'
        },
      })
    end,
  }

  use { "metalelf0/jellybeans-nvim", requires = "rktjmp/lush.nvim" }
  use {
    "ellisonleao/gruvbox.nvim",
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme gruvbox]])
    end
  }
  use {
    'projekt0n/github-nvim-theme',
    config = function()
      -- require('github-theme').setup({})

      -- vim.cmd('colorscheme github_dark')
    end
  }
  use {
    'navarasu/onedark.nvim',
    config = function()
      -- require('onedark').load()
    end
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins.null-ls')
    end
  }

  use({
    "Pocco81/true-zen.nvim",
    config = function()
       require('plugins.true-zen')
    end,
  })

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use { 'davidmh/cspell.nvim' }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = function()
			require('plugins.telescope')
		end
	}

	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('plugins.gitsigns')
		end
	}

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    after = 'nvim-treesitter',
    config = function()
      require('plugins.nvim-ufo')
    end
  }

  end
})
