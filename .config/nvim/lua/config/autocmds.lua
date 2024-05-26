-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

vim.api.nvim_create_autocmd({ "Colorscheme", "BufReadPre", "BufNewFile" }, {
  pattern = "*",
  callback = function()
    vim.cmd([[
      hi link NavicText lualine_c_normal
      hi link NavicIconsFile lualine_c_normal
      hi link NavicIconsModule lualine_c_normal
      hi link NavicIconsNamespace lualine_c_normal
      hi link NavicIconsPackage lualine_c_normal
      hi link NavicIconsClass lualine_c_normal
      hi link NavicIconsMethod lualine_c_normal
      hi link NavicIconsProperty lualine_c_normal
      hi link NavicIconsField lualine_c_normal
      hi link NavicIconsConstructor lualine_c_normal
      hi link NavicIconsEnum lualine_c_normal
      hi link NavicIconsInterface lualine_c_normal
      hi link NavicIconsFunction lualine_c_normal
      hi link NavicIconsVariable lualine_c_normal
      hi link NavicIconsConstant lualine_c_normal
      hi link NavicIconsString lualine_c_normal
      hi link NavicIconsNumber lualine_c_normal
      hi link NavicIconsBoolean lualine_c_normal
      hi link NavicIconsArray lualine_c_normal
      hi link NavicIconsObject lualine_c_normal
      hi link NavicIconsKey lualine_c_normal
      hi link NavicIconsNull lualine_c_normal
      hi link NavicIconsEnumMember lualine_c_normal
      hi link NavicIconsStruct lualine_c_normal
      hi link NavicIconsEvent lualine_c_normal
      hi link NavicIconsOperator lualine_c_normal
      hi link NavicIconsTypeParameter lualine_c_normal
      hi link NavicText lualine_c_normal
      hi link NavicSeparator lualine_c_normal
    ]])
  end,
  group = vim.api.nvim_create_augroup("mycolorscheme", { clear = true }),
  desc = "Set highlight groups for navic",
})

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup("autoupdate"),
  callback = function()
    if require("lazy.status").has_updates then
      require("lazy").update({ show = false })
    end
  end,
})
