-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.opt.colorcolumn = "90"
vim.opt.writebackup = false
vim.opt.ruler = true
vim.opt.scrolloff = 8
vim.g.lazygit_config = false
vim.g.smartindent = true
vim.opt.shortmess:append("c")
vim.opt.conceallevel = 1
vim.g.trouble_lualine = false
vim.g.snacks_animate = false
-- Enable this option to avoid conflicts with Prettier.
vim.g.lazyvim_prettier_needs_config = true
