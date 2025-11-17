local which_key = require('which-key')
local icons = require('lib.icons')

local setup = {
    preset = 'modern',
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = true,
            suggestions = 30,
        },
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    icons = {
        breadcrumb = icons.ui.ArrowOpen,
        separator = icons.ui.Arrow,
        group = '',
        keys = {
            Space = icons.ui.Rocket,
        },
        rules = false, -- enable auto icon rules
    },
    win = {
        no_overlap = true,
        border = 'rounded',
        width = 0.8,
        height = { min = 5, max = 25 },
        padding = { 1, 2 },
        title = true,
        title_pos = 'center',
        zindex = 1000,
        wo = {
            winblend = 10,
        },
    },
    layout = {
        width = { min = 20 },
        spacing = 6,
        align = 'center',
    },
    show_help = true,
    show_keys = true,
    triggers = {
        { '<leader>', mode = { 'n', 'v' } },
    },
}

local normal_mappings = {

}

local visual_mappings = {

}

local no_leader_mappings = {

}

for i = 1, 9 do
    table.insert(normal_mappings, {
        string.format('<leader>f%d', i),
        string.format('<cmd>LualineBuffersJump%d<cr>', i),
        desc = string.format('File %d', i),
    })
end

local tmux_mappings = {
    mode = 'n',
    { '<C-n>', '<cmd>NavigatorLeft<cr>', desc = 'Move Left' },
    { '<C-e>', '<cmd>NavigatorDown<cr>', desc = 'Move Down' },
    { '<C-u>', '<cmd>NavigatorUp<cr>', desc = 'Move Up' },
    { '<C-i>', '<cmd>NavigatorRight<cr>', desc = 'Move Right' },
    { '<C-\\>', '<cmd>NavigatorPrevious<cr>', desc = 'Previous Pane' },
}

which_key.setup(setup)
which_key.add(normal_mappings)
which_key.add(visual_mappings)
which_key.add(no_leader_mappings)

if vim.fn.exists('$TMUX') == 1 then
    which_key.add(tmux_mappings)
end
