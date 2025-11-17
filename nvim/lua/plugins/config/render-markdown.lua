vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.md", "*.markdown"},
  callback = function()
    vim.treesitter.start(0, "markdown")
  end,
})

local render_markdown = require('render-markdown')

render_markdown.setup({
    latex = { enabled = true }
})
