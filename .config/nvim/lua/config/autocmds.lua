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
  pattern = { "python", "rust", "java", "proto", "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 0
    vim.opt_local.expandtab = true
  end,
})

local preview = require("supermaven-nvim.completion_preview")

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  group = augroup("supermaven"),
  pattern = "*",
  callback = function(event)
    vim.api.nvim_set_hl(0, "SupermavenSuggestion", {
      fg = "#6c6c6c",
      ctermfg = 242,
      cte,
    })
    preview.suggestion_group = "SupermavenSuggestion"
  end,
})
