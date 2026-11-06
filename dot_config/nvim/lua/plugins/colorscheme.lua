return {
  -- {
  --   "wtfox/luna.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  -- },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.o.background = "dark"
    end,
    opts = {
      contrast = "hard",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "luna",
      colorscheme = "gruvbox",
    },
  },
}
