return {
  -- 主题插件
  { "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
    opts = {
      style = "storm",
      transparent = true,
      terminal_colors = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    --   on_highlights = function(hl, c)
    --     hl.CursorLineNr.fg = c.blue
    --     hl.LineNr.fg = c.blue
    --     hl.LineNrNC.fg = c.blue
    --     hl.CursorLine.fg = c.blue
    --   end,
    },
  },
}