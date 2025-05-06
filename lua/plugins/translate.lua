return {
  {
    "uga-rosa/translate.nvim",
    -- event = "VeryLazy", -- 启动后延迟加载，也可以去掉 event 让其始终加载
    config = function()
      -- 默认配置即可，无需 setup
      -- 如果需要自定义，可以这样写：
      -- require("translate").setup({
      --   default = { command = "google" },
      -- })
    end,
  },
}