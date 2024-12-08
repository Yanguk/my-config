-- blink
require("blink.cmp").setup({
  sources = {
    providers = {
      copilot = {
        name = "copilot",
        module = "blink-cmp-copilot",
      },
    },
    completion = {
      enabled_providers = { "lsp", "path", "snippets", "buffer", "copilot" },
    },
  },
  completion = {
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    menu = {
      border = "rounded",
      draw = {
        treesitter = true,
      },
    },
    documentation = {
      kind = "markdown",
      auto_show = true,
      auto_show_delay_ms = 200,
      window = {
        border = "rounded",
        treesitter_highlighting = true,
      },
    },
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
})
