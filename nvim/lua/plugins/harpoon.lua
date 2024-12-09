local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():add()
end, { desc = "[h]arpoon [a]dd mark" })

vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- vim.keymap.set("n", "<C-N>", function()
--   harpoon:list():next()
-- end, { desc = "Go to next harpoon mark" })
--
-- vim.keymap.set("n", "<C-P>", function()
--   harpoon:list():prev()
-- end, { desc = "Go to previous harpoon mark" })

vim.keymap.set("n", "<A-1>", function()
  harpoon:list():list():select(1)
end)

vim.keymap.set("n", "<A-2>", function()
  harpoon:list():list():select(2)
end)

vim.keymap.set("n", "<A-3>", function()
  harpoon:list():list():select(3)
end)

vim.keymap.set("n", "<A-4>", function()
  harpoon:list():list():select(4)
end)
