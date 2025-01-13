local js = {
  left = 'console.log("',
  right = '")',
  mid_var = '", ',
  right_var = ")",
}

return {
  "andrewferrier/debugprint.nvim",
  opts = {
    print_tag = "DEBUG_💥",
    filetypes = {
      ["typescript"] = js,
      ["typescriptreact"] = js,
      ["tsx"] = js,
      ["javascript"] = js,
      ["javascriptreact"] = js,
      ["jsx"] = js,
    },
  },
  lazy = false, -- Required to make line highlighting work before debugprint is first used
  version = "*", -- Remove if you DON'T want to use the stable version
  keys = {
    { "g?d", "<cmd>DeleteDebugPrints<CR>", desc = "Delete debug prints" },
  },
}

