local Snacks = require('snacks')
local icons = require('lib.icons')

Snacks.setup({
--    keys = {
--        { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
--        { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
--        { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
--        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
--        { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
--        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
        -- find
--        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
--        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
--        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
--        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
--        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
--        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
        -- git
--        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
--        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
--        { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
--        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
--        { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
--        { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
--        { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
        -- Grep
--        { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
--        { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
--        { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" } ,
--        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode ={ "n", "x" } },
        -- search
--        { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
--        { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
--        { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
--        { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
--        { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
--        { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
--        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
--        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
--        { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
--        { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
--        { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
--        { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
--        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
--        { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
--        { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
--        { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
--        { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
--        { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
--        { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
--        { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
--        { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
        -- LSP
--        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
--        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
--        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
--        { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
--        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
--        { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
--        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
        -- Other
--        { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
--        { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
--        { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
--        { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
--        { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
--        { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
--        { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
--        { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
--        { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
--        { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
--        { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
--        { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
--        { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
--        { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
--    },
    animate = {
        enabled = true,
        duration = 20, -- ms per step
        easing = 'linear',
        fps = 60,
    },
    bigfile = {
        enabled = true,
        notify = false,
        size = 100 * 1024, -- 100 KB
    },
    bufdelete = { enabled = true },
    dashboard = {
        enabled = true,
        sections = {
            { section = 'header' },
            {
                icon = icons.ui.Keyboard,
                title = 'Keymaps',
                section = 'keys',
                indent = 2,
                padding = 1,
            },
            {
                icon = icons.documents.File,
                title = 'Recent Files',
                section = 'recent_files',
                indent = 2,
                padding = 1,
            },
            {
                icon = icons.documents.OpenFolder,
                title = 'Projects',
                section = 'projects',
                indent = 2,
                padding = 1,
            },
            { section = 'startup' },
        },
    },
    debug = { enabled = true },
    dim = {
        enabled = true,
        scope = {
            min_size = 5,
            max_size = 20,
            siblings = true,
        },
    },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    indent = {
        enabled = true,
        priority = 1,
        char = icons.ui.SeparatorLight,
        only_scope = false,
        only_current = false,
        hl = {
            'SnacksIndent1',
            'SnacksIndent2',
            'SnacksIndent3',
            'SnacksIndent4',
            'SnacksIndent5',
            'SnacksIndent6',
            'SnacksIndent7',
            'SnacksIndent8',
        },
    },
    input = {
        enabled = true,
        icon = icons.ui.Edit,
        icon_hl = 'SnacksInputIcon',
        icon_pos = 'left',
        prompt_pos = 'title',
        win = { style = 'input' },
        expand = true,
    },
    lazygit = { enabled = true },
    notifier = {
        enabled = false,
        timeout = 2000,
        width = { min = 40, max = 0.4 },
        height = { min = 1, max = 0.6 },
        margin = { top = 0, right = 1, bottom = 0 },
        padding = true,
        sort = { 'level', 'added' },
        level = vim.log.levels.TRACE,
        icons = {
            debug = icons.ui.Bug,
            error = icons.diagnostics.Error,
            info = icons.diagnostics.Information,
            trace = icons.ui.Bookmark,
            warn = icons.diagnostics.Warning,
        },
        style = 'compact',
        top_down = true,
        date_format = '%R',
        more_format = ' ↓ %d lines ',
        refresh = 50,
    },
    notify = { enabled = false },
    profiler = { enabled = true },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scope = {
        enabled = false,
        keys = {
            textobject = {
                rr = {
                    min_size = 2, -- minimum size of the scope
                    edge = false, -- inner scope
                    cursor = false,
                    treesitter = { blocks = { enabled = false } },
                    desc = 'inner scope',
                },
                ai = {
                    cursor = false,
                    min_size = 2, -- minimum size of the scope
                    treesitter = { blocks = { enabled = false } },
                    desc = 'full scope',
                },
            },
            jump = {
                ['[a'] = {
                    min_size = 1, -- allow single line scopes
                    bottom = false,
                    cursor = false,
                    edge = true,
                    treesitter = { blocks = { enabled = false } },
                    desc = 'jump to top edge of scope',
                },
                [']a'] = {
                    min_size = 1, -- allow single line scopes
                    bottom = true,
                    cursor = false,
                    edge = true,
                    treesitter = { blocks = { enabled = false } },
                    desc = 'jump to bottom edge of scope',
                },
            },
        },
    },
    scratch = {
        enabled = true,
        name = 'SCRATCH',
        ft = function()
            if vim.bo.buftype == '' and vim.bo.filetype ~= '' then
                return vim.bo.filetype
            end
            return 'markdown'
        end,
        icon = nil,
        root = vim.fn.stdpath('data') .. '/scratch',
        autowrite = true,
        filekey = {
            cwd = true,
            branch = true,
            count = true,
        },
        win = {
            width = 120,
            height = 40,
            bo = { buftype = '', buflisted = false, bufhidden = 'hide', swapfile = false },
            minimal = false,
            noautocmd = false,
            zindex = 20,
            wo = { winhighlight = 'NormalFloat:Normal' },
            border = 'rounded',
            title_pos = 'center',
            footer_pos = 'center',

            keys = {
                ['execute'] = {
                    '<cr>',
                    function(_)
                        vim.cmd('%SnipRun')
                    end,
                    desc = 'Execute buffer',
                    mode = { 'n', 'x' },
                },
            },
        },
        win_by_ft = {
            lua = {
                keys = {
                    ['source'] = {
                        '<cr>',
                        function(self)
                            local name = 'scratch.' .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ':e')
                            Snacks.debug.run({ buf = self.buf, name = name })
                        end,
                        desc = 'Source buffer',
                        mode = { 'n', 'x' },
                    },
                    ['execute'] = {
                        'e',
                        function(_)
                            vim.cmd('%SnipRun')
                        end,
                        desc = 'Execute buffer',
                        mode = { 'n', 'x' },
                    },
                },
            },
        },
    },
    scroll = { enabled = false },
    statuscolumn = {
        enabled = true,
        left = { 'mark', 'sign' },
        right = { 'fold', 'git' },
        folds = {
            open = false,
            git_hl = false,
        },
        git = {
            patterns = { 'GitSign', 'MiniDiffSign' },
        },
        refresh = 50,
    },
    terminal = { enabled = false },
    toggle = { enabled = false },
    win = { enabled = true },
    words = { enabled = false },
    zen = {
        enabled = true,
        toggles = {
            dim = true,
            git_signs = false,
            mini_diff_signs = false,
            -- diagnostics = false,
            -- inlay_hints = false,
        },
        show = {
            statusline = false,
            tabline = false,
        },
        win = { style = 'zen' },
        zoom = {
            toggles = {},
            show = { statusline = true, tabline = true },
            win = {
                backdrop = false,
                width = 0,
            },
        },
    },
    explorer = { enabled = true },
    image = { enabled = true },
})
