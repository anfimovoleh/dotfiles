return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "horizontal", -- You can change this to 'horizontal' or 'vertical' if preferred
      shade_terminals = true,
      close_on_exit = true,
    },
    keys = {
      -- Toggle terminal
      {
        "<leader>tt",
        "<cmd>ToggleTerm<CR>",
        mode = { "n", "t" },
        desc = "Toggle Terminal",
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- Function to set terminal keymaps
      local function set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts) -- Exit terminal mode
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts) -- Alternative way to exit
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts) -- Window commands in terminal
      end

      -- Apply mappings automatically when opening a terminal
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = set_terminal_keymaps,
      })
    end,
  },
}
