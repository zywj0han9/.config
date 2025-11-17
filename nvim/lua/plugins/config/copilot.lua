
-- 禁用默认的 tab 键映射（因为 tab 常用于缩进）
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
-- 自定义接受建议的快捷键，例如使用 Ctrl+J
vim.keymap.set("i", "<C-J>", function()
  require("copilot.suggestion").accept()
end, { silent = true })

local copilot = require('copilot')

copilot.setup({
    panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
            jump_prev = '[[',
            jump_next = ']]',
            accept = '<CR>',
            refresh = 'gr',
            open = '<M-CR>',
        },
        layout = {
            position = 'bottom',
            ratio = 0.4,
        },
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = '<M-l>',
            accept_word = false,
            accept_line = false,
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = '<C-]>',
        },
    },
    filetypes = {
        yaml = true,
        markdown = true,
        help = true,
        gitcommit = true,
        gitrebase = true,
        hgcommit = true,
        svn = true,
        cvs = true,
        python = true,
        cpp = true,
        lua = true,
    },
    copilot_node_command = 'node', -- Node.js version must be > 16.x
    server_opts_overrides = {},
    --providers = {
    --    my_provider = {
    --    get_url = function(opts) return "https://api.example.com/chat" end,
    --    get_headers = function() return { ["Authorization"] = "Bearer " .. api_key } end,
    --    get_models = function() return { { id = "gpt-4.1", name = "GPT-4.1 model" } } end,
    --    prepare_input = require('CopilotChat.config.providers').copilot.prepare_input,
    --    prepare_output = require('CopilotChat.config.providers').copilot.prepare_output,
    --    }
    --}
})
