-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

-- switch tab
-- alt + left to move left and alt + left to move to the right tab
vim.api.nvim_set_keymap("n", "<A-Left>", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Right>", ":bnext<CR>", { noremap = true, silent = true })
-- switch windows
-- alt + up to move to the next window and alt + down to previous
vim.api.nvim_set_keymap("n", "<A-Up>", "<C-w>w", { noremap = true, silent = true }) -- Next window
vim.api.nvim_set_keymap("n", "<A-Down>", "<C-w>W", { noremap = true, silent = true }) -- Previous window
