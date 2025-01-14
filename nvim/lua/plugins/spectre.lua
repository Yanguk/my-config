return {
  "nvim-pack/nvim-spectre",
  dependencies = "nvim-lua/plenary.nvim",
  otps = {
    default = {
      replace = {
        cmd = "oxi",
      },
    },
    is_block_ui_break = true,
    replace_engine = {
      ["sed"] = {
        cmd = "sed",
        args = {
          "-i",
          "",
          "-E",
        },
      },
    },
  },
  keys = {
    { "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle Spectre" },
    { "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = "Search current word" },
    { "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', mode = "v", desc = "Search current word" },
    {
      "<leader>sp",
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      desc = "Search on current file",
    },
  },
  build = function()
    vim.notify("exec build.sh")

    local build_dir = vim.fn.expand("~/.local/share/nvim/lazy/nvim-spectre")

    -- `build_dir`로 이동한 후 `build.sh` 실행
    local result = vim.fn.system("cd " .. build_dir .. " && bash ./build.sh")

    -- 실행 결과 확인 후 메시지 출력
    if vim.v.shell_error == 0 then
      -- 명령이 성공적으로 완료된 경우
      vim.notify("Build script completed successfully!")
    else
      -- 명령이 실패한 경우
      vim.notify("Error executing build script: " .. result, vim.log.levels.ERROR)
    end
  end,
}
