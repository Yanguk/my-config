local options = {
  auto_install = false,
  ensure_installed = { 'c', 'lua', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim', 'dot', 'dockerfile' },
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
    filetypes = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
      'css', 'lua', 'xml', 'php', 'markdown'
    },
  },
  indent = { enable = true },
  context_commentstring = {
    enable = true,
  },
}

require('nvim-treesitter.configs').setup(options)
