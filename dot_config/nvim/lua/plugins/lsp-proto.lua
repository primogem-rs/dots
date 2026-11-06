return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "proto" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Use protols as the default protobuf LSP.
        protols = {
          mason = false,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        -- Try LSP formatting first (protols), fallback to buf formatter.
        proto = { "buf", lsp_format = "prefer" },
      },
    },
  },
}
