return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon").list():add()
      end,
      desc = "[h]arpoon [a]dd",
    },
    {
      "<C-e>",
      function()
        require("harpoon.ui").toggle_quick_menu(require("harpoon").list())
      end,
      desc = "[h]arpoon m[e]nu",
    },
    {
      "<A-1>",
      function()
        require("harpoon").list():select(1)
      end,
      desc = "harpoon select 1",
    },
    {
      "<A-2>",
      function()
        require("harpoon").list():select(2)
      end,
      desc = "harpoon select 2",
    },
    {
      "<A-3>",
      function()
        require("harpoon").list():select(3)
      end,
      desc = "harpoon select 3",
    },
    {
      "<A-4>",
      function()
        require("harpoon").list():select(4)
      end,
      desc = "harpoon select 4",
    },
  },
}

