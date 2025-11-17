-- ========================================
-- 文件名：keymap.lua
-- 作者：J0han9
-- 创建日期：20250106
-- 描述：Colemak 布局优化的 neovim 快捷键配置
-- Colemak 方向键：u(上) e(下) n(左) i(右)
-- ========================================

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.splitbelow = true

-- ========================================
-- 基础功能键（避免冲突）
-- ========================================

-- 保存和退出
vim.keymap.set('n', 'W', ':w<CR>', opts)
vim.keymap.set('n', 'q', ':q<CR>', opts)
vim.keymap.set('n', 'X', ':x<CR>', opts)
vim.keymap.set('n', 'Q', ':q!<CR>', opts)

-- 取消搜索高亮
vim.keymap.set('n', '<leader><CR>', ':noh<CR>', opts)

-- 系统剪贴板
vim.keymap.set('v', 'Y', '"+y', opts)
vim.keymap.set('n', 'P', '"+p', opts)

-- =======================================
-- Colemak 方向键映射
-- Colemak 布局：u(上) e(下) n(左) i(右)
-- ========================================

-- === 基础移动 ===
-- 普通模式
vim.keymap.set('n', 'u', 'k', opts)  -- 上
vim.keymap.set('n', 'e', 'j', opts)  -- 下
vim.keymap.set('n', 'n', 'h', opts)  -- 左
vim.keymap.set('n', 'i', 'l', opts)  -- 右

-- 可视模式
vim.keymap.set('v', 'u', 'k', opts)
vim.keymap.set('v', 'e', 'j', opts)
vim.keymap.set('v', 'n', 'h', opts)
vim.keymap.set('v', 'i', 'l', opts)

-- === 快速移动 ===
-- 5行移动
vim.keymap.set('n', 'U', '5k', opts)
vim.keymap.set('n', 'E', '5j', opts)
vim.keymap.set('v', 'U', '5k', opts)
vim.keymap.set('v', 'E', '5j', opts)

-- 行首行尾
vim.keymap.set('n', 'N', '0', opts)  -- 行首
vim.keymap.set('n', 'I', '$', opts)  -- 行尾
vim.keymap.set('v', 'N', '0', opts)
vim.keymap.set('v', 'I', '$', opts)

-- 单词移动
vim.keymap.set('n', '<C-n>', 'b', opts)  -- 前一个单词
vim.keymap.set('n', '<C-i>', 'w', opts)  -- 后一个单词

-- === 插入模式下的方向键 ===
vim.keymap.set('i', '<C-u>', '<Up>', opts)
vim.keymap.set('i', '<C-e>', '<Down>', opts)
vim.keymap.set('i', '<C-n>', '<Left>', opts)
vim.keymap.set('i', '<C-i>', '<Right>', opts)

-- ========================================
-- 重新映射被占用的重要功能
-- ========================================

-- === 插入模式 ===
vim.keymap.set('n', 'k', 'i', opts)     -- 在当前位置插入
vim.keymap.set('n', 'K', 'I', opts)     -- 在行首插入
vim.keymap.set('n', 'l', 'o', opts)     -- 下一行插入
vim.keymap.set('n', 'L', 'O', opts)     -- 上一行插入

vim.keymap.set('v', 'k', 'i', opts)
vim.keymap.set('v', 'K', 'I', opts)
vim.keymap.set('v', 'l', 'o', opts)
vim.keymap.set('v', 'L', 'O', opts)

-- === 撤销和重做 ===
vim.keymap.set('n', 'z', 'u', opts)     -- 撤销 (undo)
vim.keymap.set('n', 'Z', '<C-r>', opts)  -- 重做 (redo)


-- === 删除功能 ===
vim.keymap.set('v', 'D', '"_d', opts)  -- 删除选中内容到黑洞寄存器


-- === 搜索功能 ===
-- 下一个/上一个搜索结果
vim.keymap.set('n', '<C-e>', 'n', opts)    -- 下一个搜索结果
vim.keymap.set('n', '<C-u>', 'N', opts)    -- 上一个搜索结果
vim.keymap.set('n', 'sf', '*', opts)    -- 搜索当前单词
vim.keymap.set('n', 'sF', '#', opts)    -- 反向搜索当前单词

-- 搜索后居中
-- vim.keymap.set('n', '<C-f>', 'nzz', opts)
-- vim.keymap.set('n', '<C-F>', 'Nzz', opts)

-- ========================================
-- 窗口管理 (基于 ueni 方向)
-- ========================================

-- 窗口间跳转
vim.keymap.set('n', '<leader>u', '<C-W>k', opts)  -- 上窗口
vim.keymap.set('n', '<leader>e', '<C-W>j', opts)  -- 下窗口
vim.keymap.set('n', '<leader>n', '<C-W>h', opts)  -- 左窗口
vim.keymap.set('n', '<leader>i', '<C-W>l', opts)  -- 右窗口
vim.keymap.set('n', '<leader><leader>', '<C-W>w', opts)  -- 下一个窗口

-- 窗口大小调整
vim.keymap.set('n', '<leader>U', '<C-W>+', opts)  -- 增加高度
vim.keymap.set('n', '<leader>E', '<C-W>-', opts)  -- 减少高度
vim.keymap.set('n', '<leader>N', '<C-W><', opts)  -- 减少宽度
vim.keymap.set('n', '<leader>I', '<C-W>>', opts)  -- 增加宽度
vim.keymap.set('n', '<leader>=', '<C-W>=', opts)  -- 均分窗口

-- 窗口分割
vim.keymap.set('n', '<leader>s', ':split<CR>', opts)      -- 水平分割
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', opts)     -- 垂直分割
vim.keymap.set('n', '<leader>o', '<C-W>o', opts)          -- 只保留当前窗口

-- ========================================
-- 标签页管理
-- ========================================

-- 标签页导航
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', opts)   -- 新建空白标签页
vim.keymap.set('n', '<leader>to', ':tabnew ', { noremap = true }) -- 新建标签页并等待输入文件名
vim.keymap.set('n', 'ti', ':bnext<CR>', opts)           -- 下一个 buffer
vim.keymap.set('n', 'tn', ':bprevious<CR>', opts)       -- 上一个 buffer
vim.keymap.set('n', 'tc', ':bdelete<CR>', opts)         -- 关闭 buffer
vim.keymap.set('n', 'tC', ':bdelete!<CR>', opts)        -- 强制关闭 buffer

-- 快速跳转到指定标签页
for j = 1, 9 do
    vim.keymap.set('n', '<leader>' .. j, ':buffer ' .. j .. '<CR>', opts)
end

-- ========================================
-- 文本操作增强
-- ========================================

-- 行移动（基于 ue 上下）
vim.keymap.set('n', 'mu', ':m .-2<CR>==', opts)       -- 当前行上移
vim.keymap.set('n', 'me', ':m .+1<CR>==', opts)       -- 当前行下移
vim.keymap.set('v', 'mu', ":m '<-2<CR>gv=gv", opts)   -- 选中行上移
vim.keymap.set('v', 'me', ":m '>+1<CR>gv=gv", opts)   -- 选中行下移

-- 文本缩进（保持选择）
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- 段落移动
vim.keymap.set('n', 'gu', '{', opts)   -- 上一段
vim.keymap.set('n', 'ge', '}', opts)   -- 下一段

-- ========================================
-- 插件相关快捷键
-- ========================================

-- === 文件树 ===
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>tf', ':NvimTreeFocus<CR>', opts)
vim.keymap.set('n', '<leader>tc', ':NvimTreeCollapse<CR>', opts)

-- === DAP 调试 ===
vim.keymap.set('n', '<F5>', "<Cmd>lua require'dap'.continue()<CR>", opts)
vim.keymap.set('n', '<F6>', "<Cmd>lua require'dap'.step_over()<CR>", opts)
vim.keymap.set('n', '<F7>', "<Cmd>lua require'dap'.step_into()<CR>", opts)
vim.keymap.set('n', '<F8>', "<Cmd>lua require'dap'.step_out()<CR>", opts)

-- 断点管理
vim.keymap.set('n', '<leader>b', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.keymap.set('n', '<leader>B', "<Cmd>lua require'dap'.clear_breakpoints()<CR>", opts)
vim.keymap.set('n', '<leader>r', ':DapUIToggle<CR>', opts)

-- === LSP 功能 ===
-- 使用 Snacks 的 LSP 功能，保持你原有的配置
vim.keymap.set('n', '<leader><space>', '<cmd>lua require("snacks").picker.smart()<CR>', opts)

vim.keymap.set('n', '<leader>se', '<cmd>lua require("snacks").explorer()<CR>', opts)
vim.keymap.set('n', 'gd', '<cmd>lua require("snacks").picker.lsp_definitions()<CR>', opts)
vim.keymap.set('n', 'gr', '<cmd>lua require("snacks").picker.lsp_references()<CR>', opts)
vim.keymap.set('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

-- === Git 相关 ===
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', opts)
vim.keymap.set('n', '<leader>gb', '<cmd>lua require("snacks").picker.git_branches()<CR>', opts)
vim.keymap.set('n', '<leader>gl', '<cmd>lua require("snacks").picker.git_log()<CR>', opts)

-- === AI 助手 ===
vim.keymap.set('n', '<leader>cc', ':CopilotChat<CR>', opts)

-- === 搜索和文件查找 ===
-- 使用你现有的 Snacks 配置
vim.keymap.set('n', '<leader>ff', '<cmd>lua require("snacks").picker.files()<CR>', opts)
vim.keymap.set('n', '<leader>fg', '<cmd>lua require("snacks").picker.grep()<CR>', opts)
vim.keymap.set('n', '<leader>fb', '<cmd>lua require("snacks").picker.buffers()<CR>', opts)
vim.keymap.set('n', '<leader>fr', '<cmd>lua require("snacks").picker.recent()<CR>', opts)

-- === 终端 ===
vim.keymap.set('n', '<leader>/', '<cmd>lua require("snacks").terminal()<CR>', opts)
vim.keymap.set('t', '<leader>/', '<cmd>lua require("snacks").terminal()<CR>', opts)

-- 终端模式下的导航
vim.keymap.set('t', '<C-u>', '<C-\\><C-N><C-W>k', opts)
vim.keymap.set('t', '<C-e>', '<C-\\><C-N><C-W>j', opts)
vim.keymap.set('t', '<C-n>', '<C-\\><C-N><C-W>h', opts)
vim.keymap.set('t', '<C-i>', '<C-\\><C-N><C-W>l', opts)

-- ========================================
-- 快捷提示
-- ========================================

-- 创建一个帮助命令来显示自定义快捷键
vim.api.nvim_create_user_command('ColemakHelp', function()
    local help_text = [[
=== Colemak Neovim 键位提示 ===

方向键：
  u/e/n/i = 上/下/左/右
  U/E = 快速上下移动(5行)
  N/I = 行首/行尾

插入模式：
  k = 插入模式 (原来的i)
  K = 行首插入 (原来的I)
  l = 下一行插入 (原来的o)
  L = 上一行插入 (原来的O)

重要功能：
  z = 撤销 (原来的u)
  Z = 重做
  gn/gN = 下一个/上一个搜索结果
  gf/gF = 搜索当前单词

窗口管理：
  <leader>u/e/n/i = 窗口切换
  <leader>U/E/N/I = 窗口大小调整
  <leader>s/v = 分割窗口

文件操作：
  <leader>w/q/x = 保存/退出/保存并退出
  ti/tn = 下一个/上一个buffer
    ]]
    vim.notify(help_text)
end, {})

-- 快捷键查看帮助
vim.keymap.set('n', '<leader>?', ':ColemakHelp<CR>', opts)
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.splitbelow = true

