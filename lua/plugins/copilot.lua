return{
  -- CopilotChat.nvim 主插件
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- 官方 Copilot 插件
      { "nvim-lua/plenary.nvim", branch = "master" }, -- 辅助库
    },
    opts = {
      -- 这里可以添加 CopilotChat 的配置项
    },
    -- build = "make tiktoken", -- 仅 Mac/Linux 需要，Windows 可不加
  },
}