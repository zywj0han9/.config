-- https://github.com/nvim-treesitter/nvim-treesitter

-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/treesitter.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/treesitter.lua

-- SQL wasn't showing in my codeblocks when working with .md files, that's
-- how I found out it was missing from treesitter

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'RRethy/nvim-treesitter-endwise',
            'windwp/nvim-ts-autotag',
        },
        configure = function()
                        require('plugins.config.treesitter')
                    end,
        event = { 'BufReadPost', 'BufNewFile' },
    },
}
