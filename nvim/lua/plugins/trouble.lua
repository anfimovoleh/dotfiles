return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional for icons
  opts = {
    position = "bottom", -- Can be 'bottom', 'top', 'left', or 'right'
    height = 10, -- Height of the trouble list when position is 'bottom' or 'top'
    width = 50, -- Width of the list when position is 'left' or 'right'
    mode = "workspace_diagnostics", -- Default mode (other options: 'document_diagnostics', 'quickfix', 'lsp_references', 'loclist')
    fold_open = "", -- Icon used for open folds
    fold_closed = "", -- Icon used for closed folds
    group = true, -- Group results by file
    padding = true, -- Add an extra new line on top of the list
    action_keys = { -- Key mappings for actions in the trouble list
      close = "q", -- Close the trouble list
      cancel = "<esc>", -- Cancel the preview and get back to last window/buffer/cursor
      refresh = "r", -- Refresh the list
      jump = { "<cr>", "<tab>" }, -- Jump to the diagnostic
      open_split = { "<c-x>" }, -- Open in a split
      open_vsplit = { "<c-v>" }, -- Open in a vsplit
      open_tab = { "<c-t>" }, -- Open in a new tab
      jump_close = { "o" }, -- Jump and close the trouble list
      toggle_mode = "m", -- Toggle between 'workspace' and 'document' mode
      toggle_preview = "P", -- Toggle auto_preview
      hover = "K", -- Show documentation for the item under the cursor
      preview = "p", -- Preview the diagnostic location
      close_folds = { "zM", "zm" }, -- Close all folds
      open_folds = { "zR", "zr" }, -- Open all folds
      toggle_fold = { "zA", "za" }, -- Toggle fold of current file
      previous = "k", -- Navigate to the previous item
      next = "j", -- Navigate to the next item
    },
    indent_lines = true, -- Add indent guide below the fold icons
    auto_open = false, -- Automatically open the trouble list when diagnostics are present
    auto_close = true, -- Automatically close the list when it's empty
    auto_preview = false, -- Automatically preview the location of the diagnostic. Disabled by default.
    auto_fold = false, -- Automatically fold a file's trouble entries
    -- icons = {
    --   error = "",
    --   warning = "",
    --   hint = "",
    --   information = "",
    --   fold_open = "",
    --   fold_closed = "",
    --   other = "",
    -- },
    use_diagnostic_signs = false, -- Use signs defined in your lsp client
  },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
