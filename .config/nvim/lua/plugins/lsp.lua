local function biome_lsp_or_eslint(is_eslint)
  local has_biome = vim.fs.find({
    "biome.json",
  }, { upward = true })[1]
  if (has_biome and is_eslint) or (not has_biome and not is_eslint) then
    return { mason = false, autostart = false }
  end
  return { mason = false, autostart = true }
end

return {
  -- tools
  --
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.inlay_hints.enabled = false
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "gopls",
        "json-lsp",
        "taplo",
        "biome",
        "templ",
        "sqruff",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "css",
        "gitignore",
        "graphql",
        "http",
        "json",
        "scss",
        "sql",
        "vim",
        "lua",
        "rust",
        "markdown",
        "dockerfile",
        "go",
        "python",
        "proto",
        "solidity",
        "xml",
        "yaml",
        "templ",
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = biome_lsp_or_eslint(true),
        biome = biome_lsp_or_eslint(false),
      },
    },
  },
}
