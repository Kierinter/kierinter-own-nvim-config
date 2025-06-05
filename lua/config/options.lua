vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.keymap.set("n", "<space>", "/", { noremap = true, silent = true })    
-- 普通模式下将 <Space>w 映射为 :w
vim.keymap.set("n", "<Space>w", ":w<CR>", { noremap = true, silent = true })

-- 插入模式下将 jj 映射为 <Esc>
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })

-- 视觉模式下复制到系统剪贴板
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true })

-- 插入模式下 <C-p> 粘贴
vim.keymap.set("i", "<C-p>", "<C-r>*", { noremap = true, silent = true })

-- 普通模式下 <c-p> 粘贴
vim.keymap.set("n", "<C-p>", '"*p', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>tw", ":Translate ZH<CR>", { noremap = true, silent = true })
-- 设置字体为 JetBrainsMono Nerd Font Mono，大小为 12
vim.o.guifont = "JetBrainsMono Nerd Font Mono:h10"

-- 启用绝对行号和相对行号
vim.opt.number = true
vim.opt.relativenumber = true

-- 根据模式切换行号显示
vim.api.nvim_create_autocmd({"InsertEnter"}, {
  callback = function()
    vim.opt.relativenumber = false
    vim.opt.number = true
  end,
})

vim.api.nvim_create_autocmd({"InsertLeave"}, {
  callback = function()
    vim.opt.number = true
    vim.opt.relativenumber = true
  end,
})

vim.api.nvim_create_autocmd({"BufEnter", "WinEnter", "FocusGained"}, {
  callback = function()
    vim.opt.number = true
    vim.opt.relativenumber = true
  end,
})

vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
  callback = function()
    local curwin = vim.api.nvim_get_current_win()
    local curline = vim.api.nvim_win_get_cursor(curwin)[1]
    vim.wo.number = true
    vim.wo.relativenumber = true
    -- 只当前行为绝对行号，其他行为相对行号
    vim.wo.number = true
    vim.wo.relativenumber = true
  end,
})

-- Visual 模式下也显示绝对行号
vim.api.nvim_create_autocmd({"ModeChanged"}, {
    pattern = {"*:[vV\x16]"},
    callback = function()
        vim.opt.number = true
        vim.opt.relativenumber = false
    end,
})

-- 统一缩进设置，每个制表符为4个空格
vim.opt.expandtab = true         -- 用空格代替Tab
vim.opt.shiftwidth = 4           -- >> << 时移动4个空格
vim.opt.tabstop = 4              -- Tab 显示为4个空格
vim.opt.softtabstop = 4          -- 按退格键时相当于删除4个空格

-- 搜索时大小写不敏感，除非包含大写字母
vim.opt.ignorecase = true
vim.opt.smartcase = true
