return {
  "stevearc/aerial.nvim",
  opts = {
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
  },
  keys = {
    {
      "<leader>a",
      function()
        require("aerial").toggle()
      end,
      desc = "Toggle Aerial",
    },
  },
}
