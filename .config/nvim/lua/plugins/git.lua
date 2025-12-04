return {
  {
    "sindrets/diffview.nvim", -- optional - Diff integration
    event = "VeryLazy",
    keys = {
      {
        "<leader>gF",
        "<cmd>:DiffviewFileHistory %<cr>",
        desc = "File History",
      },
    },
  },
  -- {
  --   "NeogitOrg/neogit",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim", -- required
  --     "sindrets/diffview.nvim", -- optional - Diff integration
  --   },
  --   config = true,
  --   event = "VeryLazy",
  --   keys = {
  --     {
  --       "<leader>gn",
  --       function()
  --         require("neogit").open({ kind = "split" })
  --       end,
  --       desc = "Open Neogit",
  --     },
  --     {
  --       "<leader>gF",
  --       "<cmd>:DiffviewFileHistory %<cr>",
  --       desc = "File History",
  --     },
  --   },
  -- },
}
