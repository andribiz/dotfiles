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
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        "telescope",
        fzf_opts = {
          ["--multi"] = true,
        },
        oldfiles = {
          -- In Telescope, when I used <leader>fr, it would load old buffers.
          -- fzf lua does the same, but by default buffers visited in the current
          -- session are not included. I use <leader>fr all the time to switch
          -- back to buffers I was just in. If you missed this from Telescope,
          -- give it a try.
          include_current_session = true,
        },
        grep = {
          rg_glob = true,
          glob_flag = "--iglob", -- case insensitive globs
          -- first returned string is the new search query
          -- second returned string are (optional) additional rg flags
          -- @return string, string?
          rg_glob_fn = function(query, opts)
            local regex, flags = query:match("^(.-)%s%-%-(.*)$")
            -- If no separator is detected will return the original query
            return (regex or query), flags
          end,
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
