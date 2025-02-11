require("toggleterm").setup({
  direction = "float", -- You can change this to 'float', horizontal' or 'vertical' if preferred
  shade_terminals = true,
  close_on_exit = true,
})

-- Function to set terminal keymaps
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts) -- Exit terminal mode
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts) -- Alternative way to exit
  -- vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts) -- Move left
  -- vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts) -- Move down
  -- vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts) -- Move up
  -- vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts) -- Move right
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts) -- Window commands in terminal
end

-- Apply mappings automatically when opening a terminal
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Toggle & Close Terminal Keymaps
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true }) -- Open/collapse with Leader + tt
vim.keymap.set("t", "<leader>tt", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true }) -- Close from terminal mode
