vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

vim.cmd [[packadd packer.nvim]]

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
      { 'hrsh7th/vim-vsnip' }
    },
    config = function()
      require('plugins.lsp')
    end,
  })

  use 'mileszs/ack.vim'
  use 'junegunn/goyo.vim'
  use 'tpope/vim-fugitive'
  use 'editorconfig/editorconfig-vim'
  use 'vim-scripts/bufexplorer.zip'
  use 'kien/ctrlp.vim'

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

  use {
    'airblade/vim-gitgutter',
    after = 'github-nvim-theme',
  }

	use({
		'projekt0n/github-nvim-theme',
    tag = 'v0.0.7',
		config = function()
			require('github-theme').setup({
        theme_style = 'dark_default'
				-- ...
			})

			vim.cmd('colorscheme github_dark')
		end
	})

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

  end
})
