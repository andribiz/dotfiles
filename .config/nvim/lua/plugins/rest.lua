return {
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = {
      {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
        opts = {
          rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
        },
      },
    },
    keys = {
      { "<leader>rr", "<cmd>RestNvim<cr>", desc = "RestNvim" },
      { "<leader>rl", "<cmd>RestNvimLast<cr>", desc = "RestNvimLast" },
    },
  },
}
