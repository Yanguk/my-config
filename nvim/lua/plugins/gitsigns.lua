return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  config = function()
    require("gitsigns").setup({
      current_line_blame_opts = {
        delay = 200,
      },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "Next hunk or diff change" })

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, { desc = "Previous hunk or diff change" })

        -- Actions
        map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage current hunk" })
        map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset current hunk" })
        map("v", "<leader>hs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Stage selected hunk" })
        map("v", "<leader>hr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Reset selected hunk" })
        map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage entire buffer" })

        map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset entire buffer" })
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview current hunk" })
        map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview current hunk inline" })

        map("n", "<leader>hb", function()
          gitsigns.blame_line({ full = true })
        end, { desc = "Blame current line (detailed)" })
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
        map("n", "<leader>hd", gitsigns.diffthis, { desc = "Show diff for current file" })
        map("n", "<leader>hD", function()
          gitsigns.diffthis("~")
        end, { desc = "Show diff against the index" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk text object" })
      end,
    })
  end,
}
