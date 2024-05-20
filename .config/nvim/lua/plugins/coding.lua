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
      -- opts = function()
      --   vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      --   local cmp = require("cmp")
      --   local defaults = require("cmp.config.default")()
      --   return {
      --     auto_brackets = {}, -- configure any filetype to auto add brackets
      --     completion = {
      --       completeopt = "menu,menuone,noinsert",
      --     },
      --     mapping = cmp.mapping.preset.insert({
      --       ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      --       ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      --       ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      --       ["<C-f>"] = cmp.mapping.scroll_docs(4),
      --       ["<C-Space>"] = cmp.mapping.complete(),
      --       ["<C-e>"] = cmp.mapping.abort(),
      --       ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      --       ["<S-CR>"] = cmp.mapping.confirm({
      --         behavior = cmp.ConfirmBehavior.Replace,
      --         select = true,
      --       }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      --       ["<C-CR>"] = function(fallback)
      --         cmp.abort()
      --         fallback()
      --       end,
      --     }),
      --     sources = cmp.config.sources({
      --       { name = "nvim_lsp" },
      --       { name = "path" },
      --       { name = "luasnip" },
      --     }, {
      --       { name = "buffer" },
      --     }),
      --     formatting = {
      --       format = function(_, item)
      --         local icons = require("lazyvim.config").icons.kinds
      --         if icons[item.kind] then
      --           item.kind = icons[item.kind] .. item.kind
      --         end
      --         return item
      --       end,
      --     },
      --     experimental = {
      --       ghost_text = {
      --         hl_group = "CmpGhostText",
      --       },
      --     },
      --     sorting = defaults.sorting,
      --   }
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippet" } })
        end,
      },
    },
  },
}
