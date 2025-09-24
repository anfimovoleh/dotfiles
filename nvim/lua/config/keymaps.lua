-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- switch tab
-- alt + left to move left and alt + left to move to the right tab
-- vim.api.nvim_set_keymap("n", "<A-Left>", ":bprevious<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<A-Right>", ":bnext<CR>", { noremap = true, silent = true })
-- switch windows
-- alt + up to move to the next window and alt + down to previous
-- vim.api.nvim_set_keymap("n", "<A-Up>", "<C-w>w", { noremap = true, silent = true }) -- Next window
-- vim.api.nvim_set_keymap("n", "<A-Down>", "<C-w>W", { noremap = true, silent = true }) -- Previous window

-- unmap fzf-lua, use Telescope instead
vim.api.nvim_del_keymap("n", "<leader>fg")
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
