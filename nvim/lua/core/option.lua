-- ========================================
-- 文件名：option.lua
-- 作者：J0han9
-- 创建日期：20250106
-- 描述：neovim Option
-- ========================================

vim.g.loaded_perl_provider = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.o.hlsearch = true  -- 高亮所有匹配的搜索结果
vim.o.incsearch = true -- 实时显示搜索匹配结果
