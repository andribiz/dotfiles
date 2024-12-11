local function biome_lsp_or_prettier(bufnr)
  local has_biome = vim.fs.find({
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
  {
    "supermaven-inc/supermaven-nvim",
    build = ":SupermavenUseFree",
    commit = "df3ecf7",
    opts = {
      keymaps = {
        accept_suggestion = "<C-g>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
    },
  },
  -- {
  --   "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
  --   event = "LazyFile",
  -- },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["javascript"] = biome_lsp_or_prettier,
        ["javascriptreact"] = biome_lsp_or_prettier,
        ["typescript"] = biome_lsp_or_prettier,
        ["typescriptreact"] = biome_lsp_or_prettier,
        ["vue"] = { "biome" },
        ["css"] = biome_lsp_or_prettier,
        ["scss"] = { "biome" },
        ["less"] = { "biome" },
        ["html"] = biome_lsp_or_prettier,
        ["json"] = biome_lsp_or_prettier,
        ["jsonc"] = { "biome" },
        ["yaml"] = { "prettier" },
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        ["graphql"] = { "biome" },
        ["handlebars"] = { "biome" },
        ["proto"] = { "clang_format" },
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
      scroll = {
        enabled = true,
        animate = {
          duration = { step = 15, total = 250 },
          easing = "linear",
        },
        -- what buffers to animate
        filter = function(buf)
          return vim.g.snacks_scroll ~= false
            and vim.b[buf].snacks_scroll ~= false
            and vim.bo[buf].buftype ~= "terminal"
        end,
      },
      indent = { enabled = true },
    },
  },
}
