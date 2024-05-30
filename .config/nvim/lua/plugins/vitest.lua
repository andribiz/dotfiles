return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-vitest")({
          -- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
          filter_dir = function(name)
            return name ~= "node_modules"
          end,
        })
      )
    end,
  },
}
