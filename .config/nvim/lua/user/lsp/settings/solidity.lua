return {
    cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
    filetypes = { 'solidity' },
    root_dir = require("lspconfig.util").find_git_ancestor,
    -- require("lspconfig.util").root_pattern "foundry.toml",
    single_file_support = true,
    settings = {},
}
