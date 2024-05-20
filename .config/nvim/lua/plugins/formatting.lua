local slow_format_filetypes = {}

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {

        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
      },
    },
  },
}
