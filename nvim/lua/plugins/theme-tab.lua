require("catppuccin").setup({
  integrations = {
    blink_cmp = true,
    diffview = true,
    -- aerial = true,
    -- leap = true,
    -- lsp_trouble = true,
    -- notify = true,
    -- which_key = true,
  },
})

vim.cmd.colorscheme("catppuccin")

require("bufferline").setup({
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
  options = {
    close_command = "confirm bdelete %d",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
  },
})

local map = vim.api.nvim_set_keymap

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- Move to previous/next
map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts("Move to next buffer"))
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts("Move to previous buffer"))

-- Re-order to previous/next
-- map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
-- map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer in position...
-- map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
-- map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
-- map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
-- map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
-- map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
-- map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
-- map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
-- map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
-- map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
-- map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

-- Pin/unpin buffer
-- map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
map("n", "<leader>x", "<Cmd>confirm bdelete<CR>", opts("Buffer close"))
map("n", "<leader>X", "<Cmd>BufferLineCloseOthers<CR>", opts("Buffer close all"))

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
-- map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- map("n", "<C-s-p>", "<Cmd>BufferPickDelete<CR>", opts)

-- Sort automatically by...
-- map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
-- map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
-- map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
-- map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
-- map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
