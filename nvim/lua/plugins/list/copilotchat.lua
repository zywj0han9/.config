return {
    enable = false,
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
        { 'zbirenbaum/copilot.lua' },
        { 'nvim-lua/plenary.nvim' },
    },
    branch = 'main',
    build = 'make tiktoken', -- Only on MacOS or Linux
    cmd = {
        'CopilotChat',
        'CopilotChatToggle',
        'CopilotChatDocs',
        'CopilotChatExplain',
        'CopilotChatFix',
        'CopilotChatFixDiagnostic',
        'CopilotChatCommit',
        'CopilotChatCommitStaged',
        'CopilotChatLoad',
        'CopilotChatOptimize',
        'CopilotChatReview',
        'CopilotChatSave',
        'CopilotChatTests',
    },
    config = function()
        require('plugins.config.copilotchat')
    end,
}
