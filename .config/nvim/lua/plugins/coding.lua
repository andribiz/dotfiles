return {
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    enabled = false,
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup({
        filetypes = {
          TelescopePrompt = false,
          ["neo-tree-popup"] = false,
          ["dap-repl"] = false,
        },
      })
      vim.keymap.set("i", "<C-g>", neocodeium.accept)
    end,
  },
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   opts = function(_, opts)
  --     opts.color = {
  --       suggestion_color = "#5f87af",
  --       cterm = 67,
  --     }
  --   end,
  -- },
  {
    "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
    event = "LazyFile",
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft["templ"] = "templ"
      opts.formatters.biome = {
        command = "biome",
        args = { "check", "--write", "--unsafe", "--stdin-file-path", "$FILENAME" },
        stdin = true,
        require_cwd = true,
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = function()
      local keys = {
        {
          "<leader>hs",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>hh",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          "<leader>h" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      ---@class snacks.scroll.Config
      ---@field animate snacks.animate.Config
      bigfile = { enabled = true },
      indent = { enabled = true },
      scope = { enabled = true },
      lazygit = {
        configure = false,
        config = {
          os = { editPreset = "nvim-remote" },
        },
      },
      explorer = {
        enabled = true,
        keymaps = {
          ["l"] = "open",
        },
      },
      picker = {
        layout = {
          preset = "default",
        },
        layouts = {
          default = {
            layout = {
              box = "horizontal",
              width = 0.8,
              min_width = 120,
              height = 0.8,
              {
                box = "vertical",
                border = "rounded",
                title = "{title} {live} {flags}",
                { win = "input", height = 1, border = "bottom" },
                { win = "list", border = "none" },
              },
              { win = "preview", title = "{preview}", border = "rounded", width = 0.55 },
            },
          },
          telescope = {
            reverse = true,
            layout = {
              box = "horizontal",
              backdrop = false,
              width = 0.8,
              height = 0.9,
              border = "none",
              {
                box = "vertical",
                { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                {
                  win = "input",
                  height = 1,
                  border = "rounded",
                  title = "{title} {live} {flags}",
                  title_pos = "center",
                },
              },
              {
                win = "preview",
                title = "{preview:Preview}",
                width = 0.55,
                border = "rounded",
                title_pos = "center",
              },
            },
          },
        },
        matcher = {
          fuzzy = true, -- use fuzzy matching
          smartcase = true, -- use smartcase
          ignorecase = true, -- use ignorecase
          sort_empty = false, -- sort results when the search string is empty
          filename_bonus = true, -- give bonus for matching file names (last part of the path)
          file_pos = true, -- support patterns like `file:line:col` and `file:line`
          -- the bonusses below, possibly require string concatenation and path normalization,
          -- so this can have a performance impact for large lists and increase memory usage
          cwd_bonus = true, -- give bonus for matching files in the cwd
          frecency = true, -- frecency bonus
          history_bonus = true, -- give more weight to chronological order
        },
        keys = {
          {
            "<leader><space>",
            function()
              Snacks.picker.smart()
            end,
            desc = "Smart Find Files",
          },
        },
      },
    },
  },
}
