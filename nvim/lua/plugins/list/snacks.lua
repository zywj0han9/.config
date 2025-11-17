return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
            require('plugins.config.snacks')
    end,
}
