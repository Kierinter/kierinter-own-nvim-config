-- ~/.config/nvim/lua/plugins/coc.lua
return {
  'neoclide/coc.nvim',
  branch = 'release', -- stable branch
  build = 'npm install', -- 自动执行 npm 安装
  init = function()
    vim.g.coc_global_extensions = {
      'coc-json',
      'coc-clangd',
      'coc-pyright',
      'coc-git',
      'coc-highlight'
    }
  end,
  config = function()
    -- 显示诊断信息（浮窗）
    vim.api.nvim_create_autocmd("CursorHold", {
        pattern = "*",
        callback = function()
        vim.cmd("silent! call CocActionAsync('doHover')")
        end,
    })

    -- 虚拟文本（行尾显示诊断）
    vim.cmd([[
        " 高亮虚拟文本
        highlight CocErrorSign guifg=#FF0000
        highlight CocWarningSign guifg=#FFA500
        highlight CocInfoSign guifg=#00FFFF
        highlight CocHintSign guifg=#00FF00

        " 显示虚拟文本诊断符号（左边栏符号）
        sign define CocErrorSign text=✘ texthl=CocErrorSign linehl= numhl=
        sign define CocWarningSign text=▲ texthl=CocWarningSign linehl= numhl=
        sign define CocInfoSign text=ℹ texthl=CocInfoSign linehl= numhl=
        sign define CocHintSign text=⚑ texthl=CocHintSign linehl= numhl=
    ]])

    -- 快捷键：打开诊断浮窗
    vim.keymap.set("n", "<leader>e", "<cmd>CocDiagnostics<CR>", { silent = true, desc = "Coc: Show diagnostics" })

    -- 快捷键：快速修复
    vim.keymap.set("n", "<leader>a", "<Plug>(coc-codeaction)", { silent = true, desc = "Coc: Code action" })

    -- 快捷键：格式化
    vim.keymap.set("n", "<leader>f", "<cmd>CocCommand editor.action.formatDocument<CR>", { silent = true, desc = "Coc: Format file" })

    local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
    vim.keymap.set("i", "<TAB>", 'pumvisible() ? "\\<C-n>" : "\\<TAB>"', opts)
    vim.keymap.set("i", "<S-TAB>", 'pumvisible() ? "\\<C-p>" : "\\<S-TAB>"', opts)
    vim.keymap.set("i", "<CR>", 'pumvisible() ? "\\<C-y>" : "\\<CR>"', opts)
    vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
    vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
    vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
    vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

    -- 诊断跳转
    vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
    vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

    -- 手动触发补全
    vim.api.nvim_set_keymap("i", "<C-space>", "coc#refresh()", { expr = true, noremap = true })
  end,
}
