local blink = require('blink.cmp')
local icons = require('lib.icons')

blink.setup({
    -- 'default', 'super-tab', 'enter'
    keymap = {
        preset = 'cmdline',
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },
    -- 'preselect', 'manual', 'auto_insert'
    completion = {
        list = {
                selection = { auto_insert = true },
        },
        menu = { border = 'rounded' },
        documentation = { window = { border = 'rounded' } },
    },
    cmdline = {
        keymap = { preset = 'inherit' },
        completion = {
            menu = {
                auto_show = function(ctx)
                    return vim.fn.getcmdtype() == ':'
                    -- enable for inputs as well, with:
                    -- or vim.fn.getcmdtype() == '@'
                end,
            },
        },
    },
    signature = { window = { border = 'rounded' } },
    appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        nerd_font_variant = 'normal',
        -- kind_icons = icons.kind,
    },
    sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
            lazydev = {
                name = 'LazyDev',
                module = 'lazydev.integrations.blink',
                -- make lazydev completions top priority (see `:h blink.cmp`)
                score_offset = 100,
            },
        },
    },
})
