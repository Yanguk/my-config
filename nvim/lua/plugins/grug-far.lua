return {
  "MagicDuck/grug-far.nvim",
  keys = {
    { "<leader>S", "<cmd>lua require('grug-far').open({ transient = true })<CR>", desc = "open Grug" },
    {
      "<leader>sw",
      "<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })<CR>",
      desc = "Search current word",
    },
    {
      "<leader>sw",
      "<cmd>lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })<CR>",
      mode = "v",
      desc = "Search current word",
    },
    {
      "<leader>sp",
      "<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<CR>",
      desc = "Search on current file",
    },
  },
  opts = {},
}
