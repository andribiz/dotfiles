return {
  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = "ToggleTerm",
    keys = { { "<leader>t", "<cmd>ToggleTerm<cr>", mode = { "n" }, desc = "Toggle floating terminal" } },
    opts = {
      open_mapping = [[<leader>t]],
      insert_mappings = false,
      direction = "horizontal",
      size = 20,
      shade_filetypes = {},
      hide_numbers = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
    },
  },
}
