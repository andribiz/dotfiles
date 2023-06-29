local status_ok, lsp_installer = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

local lspconfig = require("lspconfig")

local servers = {
    "jsonls",
    "lua_ls",
    "tsserver",
    "pyright",
    "yamlls",
    "graphql",
    -- "rust_analyzer",
    "gopls",
    "marksman",
    "taplo",
    "jsonls",
    "clangd",
    "dockerls",
    "cssls",
    "tailwindcss",
    "svelte",
    "lemminx",
    "prismals",
    "solidity"
    -- "sqls",
    -- "solc",
    -- "solang",
    -- "solidity_ls"
}

lsp_installer.setup {
    ensure_installed = servers
}

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }
    local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
    end
    lspconfig[server].setup(opts)
end

-- require("lsp_extensions").inlay_hints { prefix = '', highlight = "Comment" }

--
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript",
        "javascriptreact", "javascript.jsx", "typescript",
        "typescriptreact", "typescript.tsx" },
    command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2"
})

vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
