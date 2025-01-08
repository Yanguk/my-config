-- blink
require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<C-space>"] = {},
    ["<C-b>"] = {},
    ["<C-f>"] = {},

    -- ["<C-e>"] = { "hide" },
    -- ["<C-y>"] = { "select_and_accept" },

    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },

    ["<C-u>"] = { "scroll_documentation_up", "fallback" },
    ["<C-d>"] = { "scroll_documentation_down", "fallback" },

    -- ["<Tab>"] = { "snippet_forward", "fallback" },
    -- ["<S-Tab>"] = { "snippet_backward", "fallback" },
  },
  snippets = {
    expand = function(snippet)
      require("luasnip").lsp_expand(snippet)
    end,
    active = function(filter)
      if filter and filter.direction then
        return require("luasnip").jumpable(filter.direction)
      end
      return require("luasnip").in_snippet()
    end,
    jump = function(direction)
      require("luasnip").jump(direction)
    end,
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer", "copilot" },
    providers = {
      copilot = {
        name = "copilot",
        module = "blink-cmp-copilot",
        score_offset = 100,
        async = true,
        transform_items = function(_, items)
          local CompletionItemKind = require("blink.cmp.types").CompletionItemKind

          local last_kind = CompletionItemKind[#CompletionItemKind]

          if last_kind ~= "Copilot" then
            CompletionItemKind[#CompletionItemKind + 1] = "Copilot"
          end

          local kind_idx = #CompletionItemKind

          for _, item in ipairs(items) do
            item.kind = kind_idx
          end

          return items
        end,
      },
    },
  },
  appearance = {
    kind_icons = {
      Copilot = "",
      Text = "󰉿",
      Method = "󰊕",
      Function = "󰊕",
      Constructor = "󰒓",

      Field = "󰜢",
      Variable = "󰆦",
      Property = "󰖷",

      Class = "󱡠",
      Interface = "󱡠",
      Struct = "󱡠",
      Module = "󰅩",

      Unit = "󰪚",
      Value = "󰦨",
      Enum = "󰦨",
      EnumMember = "󰦨",

      Keyword = "󰻾",
      Constant = "󰏿",

      Snippet = "󱄽",
      Color = "󰏘",
      File = "󰈔",
      Reference = "󰬲",
      Folder = "󰉋",
      Event = "󱐋",
      Operator = "󰪚",
      TypeParameter = "󰬛",
    },
  },
  completion = {
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    menu = {
      draw = {
        treesitter = { "lsp" },
      },
    },
    documentation = {
      auto_show = true,
    },
  },
})
