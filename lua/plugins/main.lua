return {
  -- 主题插件
  {
    "olimorris/onedarkpro.nvim",
    lazy = false, -- 立即加载
    priority = 1000, -- 确保最先加载
    opts = {},
    config = function()
      vim.cmd.colorscheme("onedark_vivid") -- 正确设置主题
    end,
  },
}