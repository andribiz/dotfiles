return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        window = {
          mappings = {
            ["l"] = "open",
          },
        },
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open oil folder" },
    },
  },
}
