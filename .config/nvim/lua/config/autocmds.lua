-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

-- local function augroup(name)
--   return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end
--
-- vim.api.nvim_create_autocmd("VimEnter", {
--   group = augroup("autoupdate"),
--   callback = function()
--     if require("lazy.status").has_updates then
--       require("lazy").update({ show = false })
--     end
--   end,
-- })
local function augroup(name)
  return vim.api.nvim_create_augroup("andrix_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("set_tab_4"),
  pattern = { "go" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 0
    vim.opt_local.expandtab = false
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("set_tab_space_4"),
  pattern = { "python", "rust" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 0
    vim.opt_local.expandtab = true
  end,
})
