return {
  {
    "hrsh7th/nvim-cmp",

    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      })
    end,
  },
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup()
      vim.keymap.set("i", "<C-g>", neocodeium.accept)
    end,
  },
  -- {
  --   "Exafunction/codeium.nvim",
  --   event = "BufEnter",
  --   config = function()
  --     -- Change '<C-g>' here to any keycode you like.
  --     vim.keymap.set("i", "<C-g>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true, silent = true })
  --   end,
  -- },
  --
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
  -- {
  --   "L3MON4D3/LuaSnip",
  --   dependencies = {
  --     {
  --       "rafamadriz/friendly-snippets",
  --       config = function()
  --         require("luasnip.loaders.from_vscode").lazy_load()
  --         require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippet" } })
  --       end,
  --     },
  --   },
  -- },
}
