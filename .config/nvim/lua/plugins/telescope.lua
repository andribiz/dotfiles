return {

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          LazyVim.on_load("telescope.nvim", function()
            require("telescope").load_extension("live_grep_args")
          end)
        end,
      },
    },
    opts = function(_, opts)
      local lga_actions = require("telescope-live-grep-args.actions")
      return vim.tbl_deep_extend("force", opts, {
        defaults = {
          extensions = {

            live_grep_args = {
              auto_quoting = true, -- enable/disable auto-quoting
              -- define mappings, e.g.
              mappings = { -- extend mappings
                i = {
                  ["<C-k>"] = lga_actions.quote_prompt(),
                },
              },
            },
          },
        },
      })
      -- opts.defaults.extensions = vim.list_extend(opts.defaults.extensions or {}, {
      --   live_grep_args = {
      --     auto_quoting = true, -- enable/disable auto-quoting
      --     -- define mappings, e.g.
      --     mappings = { -- extend mappings
      --       i = {
      --         ["<C-k>"] = lga_actions.quote_prompt(),
      --       },
      --     },
      --   },
      -- })
    end,
  },
}
