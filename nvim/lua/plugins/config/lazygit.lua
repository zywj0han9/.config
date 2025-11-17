vim.api.nvim_set_keymap("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })

local lazygit = require("lazygit")

lazygit.setup({
  -- 自定义配置项
  custom_config_file_path = "$HOME/.config/lazygit", -- 自定义配置文件路径
  on_exit_callback = nil, -- 退出时的回调函数
})
