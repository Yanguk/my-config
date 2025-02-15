return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    stages = "static",
  },
  config = function(_, opts)
    local notify = require("notify")

    notify.setup(opts)

    vim.notify = notify
  end,
}
