-- LSP servers and clients communicate which features they support through "capabilities".
--  By default, Neovim supports a subset of the LSP specification.
--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
--
-- This can vary by config, but in general for nvim-lspconfig:

return {
        'neovim/nvim-lspconfig',
        dependencies = {
                'williamboman/mason-lspconfig.nvim',
                'saghen/blink.cmp' 
        },
        -- example calling setup directly for each LSP
        config = function()
                -- local capabilities = require('blink.cmp').get_lsp_capabilities()
                -- local lspconfig = require('lspconfig')
                -- lspconfig['lua-ls'].setup({ capabilities = capabilities })
                     require('plugins.config.lspconfig')
                 end
}
