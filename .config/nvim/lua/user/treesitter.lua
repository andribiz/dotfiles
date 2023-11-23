local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

-- require('ts_context_commentstring').setup {} and set vim.g.skip_ts_context_commentstring_module = true to speed up loading instead
configs.setup {
    ensure_installed = { "lua",
        "go",
        "rust",
        "javascript",
        "markdown",
        "proto",
        "typescript",
        "yaml",
        "python",
        "toml",
        "graphql",
        "vimdoc",
    },                       -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false,    -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true,    -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
    -- context_commentstring = {
    --     enable = true,
    --     enable_autocmd = false,
    -- },
    -- autotag = {
    --     enable = true,
    -- },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<Enter>", -- set to `false` to disable one of the mappings
            node_incremental = "<Enter>",
            -- scope_incremental = "<C-v>",
            node_decremental = "<BS>",
        },
    }
}
