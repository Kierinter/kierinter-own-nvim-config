return{
        -- lazy.nvim 配置 Tagbar
    {
    "preservim/tagbar",
    cmd = { "TagbarToggle" },  -- 仅在调用命令时加载，提高启动性能
    keys = {
        { "<C-t>", "<cmd>TagbarToggle<CR>", desc = "Toggle Tagbar" },  -- 绑定快捷键 Ctrl+t
    },
    config = function()
        -- 可选设置，自动打开在右侧
        vim.g.tagbar_left = 0              -- 设置在右侧打开
        vim.g.tagbar_width = 30            -- 设置窗口宽度
        vim.g.tagbar_autofocus = 1         -- 切换时自动聚焦
        vim.g.tagbar_compact = 1           -- 更紧凑的显示
        vim.g.tagbar_sort = 0              -- 保持源文件顺序
    end
    }
}
