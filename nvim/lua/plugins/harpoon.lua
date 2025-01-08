local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():add()
end, { desc = "[h]arpoon [a]dd" })
vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "[h]arpoon m[e]nu" })

vim.keymap.set("n", "<A-1>", function()
  harpoon:list():select(1)
end, { desc = "harpoon select 1" })
vim.keymap.set("n", "<A-2>", function()
  harpoon:list():select(2)
end, { desc = "harpoon select 2" })
vim.keymap.set("n", "<A-3>", function()
  harpoon:list():select(3)
end, { desc = "harpoon select 3" })
vim.keymap.set("n", "<A-4>", function()
  harpoon:list():select(4)
end, { desc = "harpoon select 4" })

-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<A-P>", function()
--   harpoon:list():prev()
-- end)
-- vim.keymap.set("n", "<A-N>", function()
--   harpoon:list():next()
-- end)
