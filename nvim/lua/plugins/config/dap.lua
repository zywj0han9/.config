local dap = require('dap')
local dapui = require('dapui')
local icons = require('lib.icons')

dapui.setup({
    icons = { expanded = icons.ui.ArrowClosed, collapsed = icons.ui.ArrowOpen },
    mappings = {
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
        toggle = 't',
    },
    expand_lines = vim.fn.has('nvim-0.7'),
    layouts = {
        {
            elements = {
                { id = 'scopes', size = 0.25 },
                'breakpoints',
                'stacks',
                'watches',
            },
            size = 40,
            position = 'right',
        },
        {
            elements = {
                'repl',
                'console',
            },
            size = 0.25,
            position = 'bottom',
        },
    },
    floating = {
        max_height = nil,
        max_width = nil,
        border = 'rounded',
        mappings = {
            close = { 'q', '<Esc>' },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil,
    },
})

vim.fn.sign_define('DapBreakpoint', { text = icons.ui.Bug, texthl = 'DiagnosticSignError', linehl = '', numhl = '' })

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    -- dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    -- dapui.close()
end

dap.adapters.python = {
    type = 'executable',
    command = vim.fn.exepath('python3'),
    args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = 'Launch file',

        program = '${file}',
        pythonPath = vim.fn.exepath('python3')
        --function()
        --    local cwd = vim.fn.getcwd()
        --    if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        --        return cwd .. '/venv/bin/python'
        --    elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        --        return cwd .. '/.venv/bin/python'
        --    elseif vim.fn.executable('/usr/bin/python') then
        --        return '/usr/bin/python'
        --    else
        --        return vim.fn.exepath('python3')
        --    end
        --end,
    },
}

dap.adapters.ruby = {
    type = 'executable',
    command = 'bundle',
    args = { 'exec', 'readapt', 'stdio' },
}

dap.configurations.ruby = {
    {
        type = 'ruby',
        request = 'launch',
        name = 'Rails',
        program = 'bundle',
        programArgs = { 'exec', 'rails', 's' },
        useBundler = true,
    },
}
dap.adapters.cppgdb = {
    id = 'cppgdb',
    type = 'executable',
    command = '/usr/bin/gdb',
    name = 'gdb',
}

dap.configurations.cpp = {
    {
    name = "Launch Program",
    type = "cppgdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ',  '/usr/bin/gdb', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
    args = {},
    MIMode = "gdb",  -- 使用 gdb 调试器时使用 'gdb'
    setupCommands = {
      {
        description = "Enable pretty-printing for gdb",
        text = "-enable-pretty-printing",
        ignoreFailures = true
      },
    },
    miDebuggerPath = "/usr/bin/gdb",  -- gdb 的路径
    externalConsole = false,
  },
}

vim.api.nvim_create_user_command('DapUIToggle', function()
    require('dapui').toggle()
end, {})

