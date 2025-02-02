return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
  },
  keys = {
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Debug: Start/Continue",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Debug: Step Into",
    },
    {
      "<leader>do",
      function()
        require("dap").step_out()
      end,
      desc = "Debug: Step Out",
    },
    {
      "<leader>dO",
      function()
        require("dap").step_over()
      end,
      desc = "Debug: Step Over",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Debug: Toggle Breakpoint",
    },
    {
      "<leader>dt",
      function()
        require("dap").terminate()
      end,
      desc = "Debug: Terminate",
    },
  },
  config = function()
    require("mason-nvim-dap").setup({
      ensure_installed = {
        "codelldb",
        "js",
      },
      handlers = {
        function(config)
          -- all sources with no handler get passed here
          -- Keep original functionality
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })

    local dap, dapui = require("dap"), require("dapui")

    dapui.setup({})

    local function get_pkg_path(pkg, path)
      pcall(require, "mason")
      local root = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")
      path = path or ""
      local ret = root .. "/packages/" .. pkg .. "/" .. path
      return ret
    end

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        args = {
          get_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js"),
          "${port}",
        },
      },
    }

    dap.configurations.zig = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
    }

    for _, language in ipairs({ "typescript", "javascript", "typescriptreact" }) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }
    end

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
  end,
}
