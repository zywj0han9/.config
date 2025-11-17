return {
    'kndndrj/nvim-dbee',
    dependencies = {
        'MunifTanjim/nui.nvim',
    },
    build = function()
                require('dbee').install('curl')
    end,
    config = function()
                 require('plugins.config.dbee')
    end,
    cmd = 'DBToggle',
    enabled = false,
}
