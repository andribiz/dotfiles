return {
  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = "ToggleTerm",
    keys = {
      {
        "<leader>Tf",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 0, LazyVim.root.get(), "float")
        end,
        desc = "ToggleTerm (float root_dir)",
      },
      {
        "<leader>Th",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 20, LazyVim.root.get(), "horizontal")
        end,
        desc = "ToggleTerm (horizontal root_dir)",
      },
      {
        "<leader>Tv",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, vim.o.columns * 0.4, LazyVim.root.get(), "vertical")
        end,
        desc = "ToggleTerm (vertical root_dir)",
      },
      {
        "<leader>Tt",
        "<cmd>2ToggleTerm direction=horizontal size=20<cr>",
        mode = { "n" },
        desc = "Toggle floating terminal",
      },
    },
    opts = {
      open_mapping = [[<c-t>]],
      insert_mappings = true,
      direction = "horizontal" or "vertical" or "window" or "float",
      size = function(term)
        if term.direction == "horizontal" then
          return 20
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      shade_filetypes = {},
      shade_terminals = true,
      hide_numbers = true,
      terminal_mappings = true,
      start_in_insert = false,
      close_on_exit = true,
    },
  },
}
