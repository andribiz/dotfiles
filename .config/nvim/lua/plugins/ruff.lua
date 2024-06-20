return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff_lsp = {
          init_options = {
            settings = {
              lint = { args = { "--select", "I", "--fix" } },
            },
          },
        },
      },
    },
  },
}
