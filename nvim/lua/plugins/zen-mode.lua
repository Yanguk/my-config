vim.keymap.set("n", "<leader>zm", function()
  require("zen-mode").toggle({
    -- window = {
    --   width = 0.85, -- width will be 85% of the editor width
    -- },
  })
end, { noremap = true, silent = true })
