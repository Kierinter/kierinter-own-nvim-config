vim.g.mapleader = ","
vim.g.maplocalleader = ","

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
    vim.opt.number = false
    vim.opt.relativenumber = true 
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
