return {
    'uga-rosa/ccc.nvim',
    config = function()
                 require('plugins.config.ccc')
    end,
    cmd = { 'CccHighlighterToggle', 'CccConvert', 'CccPick' },
}
