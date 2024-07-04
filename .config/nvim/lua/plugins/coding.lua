local function biome_lsp_or_prettier(bufnr)
  -- local has_biome_lsp = vim.lsp.get_active_clients({
  --   bufnr = bufnr,
  --   name = "biome",
  -- })[1]
  -- if has_biome_lsp then
  --   return {}
  -- end
  local has_biome = vim.fs.find({
    -- https://prettier.io/docs/en/configuration.html
    "biome.json",
  }, { upward = true })[1]
  if has_biome then
    return { "biome_check_unsafe" }
  end
  return { "prettier" }
end

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
  {
    "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
    event = "LazyFile",
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["javascript"] = biome_lsp_or_prettier,
        ["javascriptreact"] = biome_lsp_or_prettier,
        ["typescript"] = biome_lsp_or_prettier,
        ["typescriptreact"] = biome_lsp_or_prettier,
        ["vue"] = { "biome" },
        ["css"] = { "biome" },
        ["scss"] = { "biome" },
        ["less"] = { "biome" },
        ["html"] = { "biome" },
        ["json"] = biome_lsp_or_prettier,
        ["jsonc"] = { "biome" },
        ["yaml"] = { "biome" },
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        ["graphql"] = { "biome" },
        ["handlebars"] = { "biome" },
      },
      formatters = {
        biome_check_unsafe = {
          command = "biome",
          args = { "check", "--write", "--unsafe", "--stdin-file-path", "$FILENAME" },
          stdin = true,
          -- A function that calculates the directory to run the command in
          cwd = require("conform.util").root_file({ "biome.json", "biome.jsonc" }),
          require_cwd = true,
        },
      },
    },
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
}
