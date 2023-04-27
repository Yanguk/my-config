vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
  ---------------------
  -- Package Manager --
  ---------------------
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -------- color
  use 'RRethy/nvim-base16'

  ------- lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  ---- custome
  use 'mileszs/ack.vim'
  use 'junegunn/goyo.vim'
  use 'tpope/vim-fugitive'
  use 'editorconfig/editorconfig-vim'
  use 'vim-scripts/bufexplorer.zip'
  use 'kien/ctrlp.vim'
  use 'terryma/vim-multiple-cursors'
  use 'airblade/vim-gitgutter'
  use {'Xuyuanp/nerdtree-git-plugin', requires = 'preservim/nerdtree'}
  use 'simrat39/rust-tools.nvim'

	---- autuTag
	use { 'nvim-treesitter/nvim-treesitter' }
	use {
		'windwp/nvim-ts-autotag',
		config = function()
			require('plugins.treesitter')
		end
	}

  -- comment
  use 'terrortylor/nvim-comment'

  -- indent
  use 'lukas-reineke/indent-blankline.nvim'

  -- ligthLine
  use 'itchyny/lightline.vim'

  end,
  config = {},
})
