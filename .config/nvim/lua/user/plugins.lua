local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- Install your plugins here
require("lazy").setup {
    -- My plugins here
    "nvim-lua/popup.nvim",   -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
    { "numToStr/Comment.nvim", event = "VeryLazy",
        config = function() require("user.comment") end
    }, -- Easily comment stuff
    { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
    { "nvim-tree/nvim-tree.lua", event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require('user.nvim-tree') end
    },
    { "akinsho/bufferline.nvim",
        event = { "bufEnter" },
        config = function() require('user.bufferline') end,
    },
    -- use "moll/vim-bbye"
    { "akinsho/toggleterm.nvim", event = "VeryLazy",
        config = function() require("user.toggleterm") end,
    },
    { "RRethy/vim-illuminate",       event = "VeryLazy", },
    -- use "ahmedkhalf/project.nvim" --Temp disabled
    -- use { "glepnir/dashboard-nvim", config = "require 'user.dashboard'" }
    -- use "goolord/alpha-nvim"
    { "lukas-reineke/indent-blankline.nvim",
        config = function() require('user.indent-blankline') end,
    },
    { "kylechui/nvim-surround", event = "VeryLazy",
        config = function() require("nvim-surround").setup({}) end,
    },
    {
        'phaazon/hop.nvim',
        event = "VeryLazy",
        config = function() vim.defer_fn(function() require('user.hop') end, 2000) end,
    },
    -- color schemes
    -- use "morhetz/gruvbox"
    { "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function() require("user.colorscheme") end,
    },
    { "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function() require('user.lualine') end,
    },
    -- completion
    { "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",  -- buffer completions
            "hrsh7th/cmp-path",    -- path completions
            "hrsh7th/cmp-cmdline", -- cmdline completions
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-emoji",
            "saadparwaiz1/cmp_luasnip", -- snippet completions
            "hrsh7th/cmp-nvim-lsp",
            "onsails/lspkind.nvim",
            "L3MON4D3/LuaSnip",             --snippet engine
            "rafamadriz/friendly-snippets", -- a bunch of snippets to use
        },
        config = function() require("user.cmp") end,
    }, -- The completion plugin
    -- LSP
    { "neovim/nvim-lspconfig",
        event = { 'BufRead', 'BufNewFile' },
        config = function() require("user.lsp") end,
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        -- event = { 'BufRead', 'BufNewFile' },
        build = ":TSUpdate",
        config = function() require("user.treesitter") end,
    },

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters an
    { "tomlion/vim-solidity", ft = { "solidity" } },
    { "j-hui/fidget.nvim", -- Lsp Progress
        config = function() require("fidget").setup {} end,
    },
    { "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        config = function() require("user.lsp_signature") end,
    },
    -- Telescope
    { "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-telescope/telescope-live-grep-args.nvim",
            "nvim-telescope/telescope-dap.nvim",
            "nvim-telescope/telescope-symbols.nvim",
            'nvim-telescope/telescope-ui-select.nvim',
        },
        config = function() require('user.telescope') end,
    },
    { "HiPhish/rainbow-delimiters.nvim",
        config = function() require('user.rainbow') end,
    },
    { "petertriho/nvim-scrollbar",
        config = function() require('user.scrollbar') end,
    },
    -- Typescript
    { "JoosepAlviste/nvim-ts-context-commentstring",
        ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        -- config = "require(user.typescript-tools)",
        config = function()
            require("typescript-tools").setup {}
        end,
        ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
    },

    { "windwp/nvim-ts-autotag", dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function() require('user.nvim-ts-autotag') end,
        event = "InsertEnter",
        ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    }, -- Autotag for tsx
    { "windwp/nvim-autopairs", event = "InsertEnter",
        config = function() require("user.autopairs") end,
    }, -- Autopairs, integrates with both cmp and treesitter
    {
        "SmiteshP/nvim-navic",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function() require('user.navic') end,
    },
    {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim" -- Optional
        },
    },
    -- chatgpt
    {
        "jackMort/ChatGPT.nvim",
        cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTCompleteCode" },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        },
        config = function() require("user.chatgpt") end,
    },

    -- Git
    { "lewis6991/gitsigns.nvim",
        config = function() require("user.gitsign") end,
    },
    -- debug
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        event = "VeryLazy",
        config = function() require("user.dapui") end,
    },
    { "theHamsta/nvim-dap-virtual-text",
        config = function() require("user.nvim-dapp-virtual-text") end,
    },
    -- use { "folke/trouble.nvim", cmd = "TroubleToggle", config = "require 'trouble'.setup {}" }
    -- Rust
    { "mrcjkb/rustaceanvim", ft = { "rust" },
        config = function() require('user.rust_tools') end,
    }, -- for rust enhancement
    {
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    },
    -- git
    { 'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
    },
    -- UML
    { "aklt/plantuml-syntax",             ft = { "plantuml" } },
    { "weirongxu/plantuml-previewer.vim", ft = { "plantuml" } },
    { "tyru/open-browser.vim",            ft = { "plantuml" } },
    -- Python
    { "mfussenegger/nvim-dap-python", ft = { "python" },
        config = function() require('user.nvim-dap-python') end,
    },
    -- Go
    { "leoluz/nvim-dap-go", ft = { 'go' },
        config = function() require('user.dap-go') end,
    },
    -- Markdown
    { "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    -- kdl
    -- use { "imsnif/kdl.vim", ft = { 'kdl' } }
    -- Keyboard AI
    { 'tzachar/cmp-tabnine',
        build = './install.sh', dependencies = 'hrsh7th/nvim-cmp',
        config = function() require("user.cmp-tabnine") end,
    },
    -- obsidian
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        event = {
            -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
            -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
            "BufReadPre /Users/andrix/Nextcloud/brainvault/brainvault/**.md",
            "BufNewFile /Users/andrix/Nextcloud/brainvault/brainvault/**.md",
        },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        config = function() require("user.obsidian") end,

        -- see below for full list of options 👇
    },
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
}
