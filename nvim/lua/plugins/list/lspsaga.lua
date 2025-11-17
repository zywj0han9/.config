return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('plugins.config.lspsaga')
    end,
    event = 'LspAttach',
}
