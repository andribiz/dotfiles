local lspname = {
  -- lsp server name .
  function()
    local msg = "no active lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = " lsp:",
}

return {
  {
    "rcarriga/nvim-notify",
    opts = function(_, opts)
      opts.render = "compact"
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.presets.command_palette = false
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options.numbers = "ordinal"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.remove(opts.sections.lualine_z)
      table.insert(opts.sections.lualine_z, lspname)
    end,
  },
  --scrollbar
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
  },
  --   {
  --
  --     "nvimdev/dashboard-nvim",
  --
  --     opts = function(_, opts)
  --       local logo = [[
  -- ⠀⠀⠀⠀⠀⠀⠀⢀⣀⡤⠔⢒⡒⠀⢐⠶⠒⠦⡄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  -- ⠀⠀⠀⠀⢀⠤⠊⢁⠊⠀⠀⠀⠈⢲⠁⠀⠀⠀⠘⡄⠁⠢⣀⠀⠀⠀⠀⠀⠀⠀
  -- ⠀⠀⢀⠔⠁⠀⠀⣞⠀⠀⠀⢰⣶⢸⢸⡷⠀⠀⠀⣡⡀⠀⠈⠢⡀⠀⠀⠀⠀⠀
  -- ⠀⢠⠂⠀⠀⡠⠐⠚⢄⠀⠀⠀⣡⣿⣧⣀⠀⢀⡠⠃⠀⠁⠢⡀⠈⢄⠀⠀⠀⠀
  -- ⠀⠆⠀⡠⠚⠀⠄⡀⠀⠉⠉⠉⢏⠣⠄⢸⠀⠀⠀⢀⡠⠄⠂⠉⢆⠘⡀⠀⠀⠀
  -- ⢸⠀⡐⠀⠀⠀⠀⠀⠈⠑⠂⠀⠈⠓⡖⠁⠀⠀⠈⠁⠀⠀⠀⠀⢀⡆⡇⠀⠀⠀
  -- ⠀⠀⡇⠀⠀⠀⠀⠒⠒⠂⠀⠀⠀⠀⡇⠀⠀⠀⠀⠉⠉⠁⠀⡴⠀⠱⡇⠀⠀⠀
  -- ⢸⠀⡇⠀⠱⡀⣀⡀⠤⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠒⠒⡲⠂⠀⡆⡇⠀⠀⠀
  -- ⠈⡆⢁⠈⠉⠉⢄⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⢀⠔⠀⠀⢠⢡⠁⠀⠀⠀
  -- ⠀⠰⡈⢄⠀⠀⠀⠁⠢⢀⠀⠀⠀⠀⢈⠀⠀⠀⢀⠔⠉⠀⠀⢀⢆⠃⠄⠒⠢⠄
  -- ⠀⠀⠐⢌⠂⠀⠀⠀⠀⠀⠉⠐⠂⠤⠼⠄⠒⠈⠀⠀⠀⠀⢀⣾⠣⠎⠀⠀⠀⢸
  -- ⠀⠀⠀⠀⢱⢕⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⠠⢾⠁⠀⠈⢄⠀⠀⠈
  -- ⠀⠀⠀⠀⡨⠒⠠⠬⠍⣉⣉⣉⣉⡽⣭⣭⢹⡅⠠⡤⠄⠒⡉⠀⠀⡠⠃⠀⠀⠀
  -- ⠀⠀⠀⡰⠁⠀⠀⢀⠒⠁⠀⠀⠐⡍⠀⡦⢈⠇⠀⠈⢢⠀⢁⡀⠊⠀⠀⠀⠀⠀
  -- ⠀⠀⢠⡇⠀⡄⠀⠇⠀⠀⠀⠀⠀⠈⠒⠓⠁⠀⠀⠀⠀⠆⢸⠀⠀⠀⠀⠀⠀⠀
  -- ⠀⠀⠐⢇⠀⡅⠀⠀⠐⠒⠒⠀⠀⠀⠀⠀⠀⠀⠈⠉⠂⠘⠈⠀⠀⠀⠀⠀⠀⠀
  -- ⠀⠀⠀⠀⠑⡦⠀⢃⠀⢇⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⢀⠃⡇⠀⠀⠀⠀⠀⠀⠀
  -- ⠀⢰⡋⠉⡦⡄⠀⠀⠑⢄⠑⠠⠄⣀⣀⣀⠠⠄⢊⡠⠃⢠⠀⠀⠀⠀⠀⠀⠀⠀
  -- ⠀⠈⠃⠐⠁⠇⠀⠀⠀⠀⠉⠒⠠⠤⠤⠤⠀⠒⠁⠀⢀⠃⠀⠀⠀⠀⠀⠀⠀⠀
  -- ⠀⠀⢀⡀⠴⢄⠀⠀⠀⠀⠀⠀⠀⡴⣊⣁⠀⢀⣀⢀⣌⠀⠀⠀⠀⠀⠀⠀⠀⠀
  -- ⠀⠀⡇⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⡁⠀⠀⠀⠀⠀⠀⠀⠉⢢⠀⠀⠀⠀⠀⠀⠀
  -- ⠀⠀⠑⠤⢀⣀⣀⣀⡀⠀⠤⠔⠚⠒⠠⠤⠤⠤⠤⠤⠤⠐⠊⠀⠀⠀⠀⠀⠀⠀
  --       ]]
  --
  --       logo = string.rep("\n", 8) .. logo .. "\n\n"
  --       opts.config.header = vim.split(logo, "\n")
  --     end,
  --   },
  {
    "numToStr/Navigator.nvim",
    opts = {
      -- Save modified buffer(s) when moving to mux
      -- nil - Don't save (default)
      -- 'current' - Only save the current modified buffer
      -- 'all' - Save all the buffers
      auto_save = nil,

      -- Disable navigation when the current mux pane is zoomed in
      disable_on_zoom = false,

      -- Multiplexer to use
      -- 'auto' - Chooses mux based on priority (default)
      -- table - Custom mux to use
      mux = "auto",
    },
    cmd = {
      "NavigatorLeft",
      "NavigatorRight",
      "NavigatorUp",
      "NavigatorDown",
      "NavigatorPrevious",
    },
    keys = {
      { "<c-h>", "<cmd>NavigatorLeft<cr>", desc = "NavigatorLeft" },
      { "<c-j>", "<cmd>NavigatorDown<cr>", desc = "NavigatorDown" },
      { "<c-k>", "<cmd>NavigatorUp<cr>", desc = "NavigatorUp" },
      { "<c-l>", "<cmd>NavigatorRight<cr>", desc = "NavigatorRight" },
    },
  },
}
