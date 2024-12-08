local js = {
  left = 'console.log("',
  right = '")',
  mid_var = '", ',
  right_var = ")",
}

require("debugprint").setup({
  filetypes = {
    ["typescript"] = js,
    ["typescriptreact"] = js,
    ["tsx"] = js,
    ["javascript"] = js,
    ["javascriptreact"] = js,
    ["jsx"] = js,
  },
})

vim.keymap.set("n", "g?d", "<cmd>DeleteDebugPrints<CR>", { desc = "Delete debug prints" })
