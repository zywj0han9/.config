return {
    'windwp/nvim-autopairs',
    config = function()
                require('plugins.config.autopairs')
    end,
    event = 'InsertEnter',
}
