local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("mason").setup()
require("mason-lspconfig").setup()
-- require("mason-lspconfig").setup_handlers {
--     -- The first entry (without a key) will be the default handler
--     -- and will be called for each installed server that doesn't have
--     -- a dedicated handler.
--     function(server_name) -- default handler (optional)
--         require("lspconfig")[server_name].setup {}
--     end,
-- }
require("user.lsp.configs")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
