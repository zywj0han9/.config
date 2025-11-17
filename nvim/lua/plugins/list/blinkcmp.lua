return {
        'saghen/blink.cmp',
        dependencies = {
            'moyiz/blink-emoji.nvim',
            'rafamadriz/friendly-snippets',
            'giuxtaposition/blink-cmp-copilot',
            'dmitmel/cmp-digraphs',
        },
        version = '*',
        config = function()
                 require('plugins.config.blink')
                 end,
        opts_extend = { 'sources.default' },
        event = { 'InsertEnter' },
}
