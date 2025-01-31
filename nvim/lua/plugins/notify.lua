return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    stages = "static",
    render = "minimal",
  },
  config = function(_, opts)
    local notify = require("notify")

    notify.setup(opts)

    vim.notify = notify
  end,
}
