require("typescript-tools").setup {

}

local opts = { noremap = true, silent = true }
-- vim.api.nvim_buf_set_keymap(0, "n", "<leader>oi", ":TSToolsOrganizeImports<CR>", opts)
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*.ts*",
--     command = ":TSToolsRemoveUnusedImports sync", -- added `sync` here
-- })
