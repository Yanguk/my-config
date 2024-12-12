local map = vim.keymap.set

local default_config = {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  on_init = function(client)
    client.server_capabilities.semanticTokensProvider = nil
  end,
  on_attach = function(client, bufnr)
    local function opts(desc)
      return { buffer = bufnr, desc = desc }
    end

    map(
      "n",
      "go",
      "<cmd>Trouble lsp_type_definition toggle focus=true auto_refresh=false<CR>",
      opts("Trouble lsp_type_definition")
    )
    map(
      "n",
      "gi",
      "<cmd>Trouble lsp_implementations toggle focus=true auto_refresh=false<CR>",
      opts("Trouble lsp_implementations")
    )
    map(
      "n",
      "gr",
      "<cmd>Trouble lsp_references toggle focus=true auto_refresh=false<CR>",
      opts("Trouble lsp_references")
    )
    map(
      "n",
      "gd",
      "<cmd>Trouble lsp_definitions toggle focus=true auto_refresh=false<CR>",
      opts("Trouble lsp_definitions")
    )

    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
    map("n", "<leader>ra", vim.lsp.buf.rename, opts("rename"))
    map("n", "K", vim.lsp.buf.hover, opts("Code action"))

    if client.server_capabilities.inlayHintProvider then
      map("n", "<leader>ih", function()
        local current_setting = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })

        vim.lsp.inlay_hint.enable(not current_setting, { bufnr = bufnr })
      end, opts("toggle [I]nlay [H]ints"))
    end
  end,
}

-- nvim-ufo (ts 에서 배열을 폴드할려면 lsp로 해야함)
default_config.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

----- blink
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
    list = {
      max_items = 20,
    },
    menu = {
      border = "rounded",
      draw = {
        treesitter = true,
      },
    },
    documentation = {
      auto_show = true,
      window = {
        border = "rounded",
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

---@diagnostic disable-next-line: deprecated
table.unpack = table.unpack or unpack

-- mason
require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
})

local lspconfig = require("lspconfig")

-- server setup
local server_configs = {
  "lua_ls",
  "zls",
  "yamlls",
  "tailwindcss",
  "graphql",
  "prismals",
  ["typos_lsp"] = {
    init_options = {
      config = "~/.config/nvim/typos.toml",
    },
  },

  ["eslint"] = {
    on_attach = function(client, bufnr)
      default_config.on_attach(client, bufnr)

      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  },
  ["bashls"] = {
    filetypes = { "sh", "zsh", "bash" },
  },
  ["clangd"] = {
    capabilities = {
      offsetEncoding = "utf-16",
    },
  },
}

for k, v in pairs(server_configs) do
  local server, config = table.unpack(
    type(k) == "number" and { v, default_config } or { k, vim.tbl_deep_extend("force", default_config, v) }
  )

  lspconfig[server].setup(config)
end
