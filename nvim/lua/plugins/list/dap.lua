return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
    },
    config = function()
                 require('plugins.config.dap')
             end,
    cmd = {'DapUIToggle', 'DapToggleRepl', 'DapToggleBreakpoint' },
}
