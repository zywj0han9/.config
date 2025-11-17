return {
    'nvim-neotest/neotest',
    dependencies = {
        'nvim-neotest/nvim-nio',
        'olimorris/neotest-rspec',
        'nvim-neotest/neotest-jest',
        'nvim-neotest/neotest-python',
    },
    config = function()
                 require('plugins.config.neotest')
             end,
    cmd = 'Neotest',
}
