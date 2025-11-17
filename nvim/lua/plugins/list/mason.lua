return {
    'williamboman/mason.nvim',
    config = function()
                 require('plugins.config.mason')
             end,
    cmd = 'Mason'
}
