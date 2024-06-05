return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      {

        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        dependencies = {
          {
            "kkharji/sqlite.lua",
          },
        },
      },
    },
    opts = function(_, opts)
      local lga_actions = require("telescope-live-grep-args.actions")
      return vim.tbl_deep_extend("force", opts, {
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
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
          smart_open = {
            match_algorithm = "fzf",
            show_scores = true,
          },
        },
      })
    end,
    keys = {
      { "<leader>/", "<cmd>Telescope live_grep_args<cr>", desc = "Live grep args" },
      {
        "<leader><leader>",
        function()
          require("telescope").extensions.smart_open.smart_open()
        end,
        desc = "Smart Open",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("live_grep_args")
      telescope.load_extension("fzf")
      telescope.load_extension("smart_open")
    end,
  },
}
