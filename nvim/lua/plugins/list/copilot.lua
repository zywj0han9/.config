return {
    enable = false,
    "zbirenbaum/copilot.lua",
--   dependencies = { 'ginuxtaposition/blink-cmp-copilot' },
    event = "InsertEnter",  -- 插入模式下加载
    config = function()
            require('plugins.config.copilot')
    end,
}

