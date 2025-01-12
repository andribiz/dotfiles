-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x', opts)
-- keymap.set("n", "J", "5j", opts)
-- keymap.set("n", "K", "5K", opts)

keymap.set("n", "<C-s>", "<cmd>:w<cr>", opts) -- save
keymap.set("i", "<C-s>", "<Esc>:w<cr>", opts) -- save
keymap.set("n", "Q", function()
  Snacks.bufdelete()
end, opts)

keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- keymap.set("n", "<C-d>", "<C-d>zz", opts)
-- keymap.set("n", "<C-u>", "<C-u>zz", opts)
keymap.set("n", "yc", "yygccp", { remap = true })

-- bufferline
keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<cr>", opts)
keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<cr>", opts)
keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<cr>", opts)
keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<cr>", opts)
keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<cr>", opts)
keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<cr>", opts)
keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<cr>", opts)
keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<cr>", opts)
keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<cr>", opts)
