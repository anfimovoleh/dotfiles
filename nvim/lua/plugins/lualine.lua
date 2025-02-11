return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "gruvbox", -- Choose a theme that matches your colorscheme (e.g., gruvbox, dracula, nord, etc.)
        section_separators = { left = "|", right = "|" },
        component_separators = { left = ":", right = ":" },
        icons_enabled = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        }, -- Show mode as a single letter
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          {
            "filename",
            file_status = true, -- Show modified state
            path = 1, -- Show relative path
            symbols = {
              modified = " ●", -- Symbol for modified files
              readonly = " ", -- Symbol for readonly files
            },
          },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" }, -- File progress as percentage
        lualine_z = { "location" }, -- Cursor position (line/column)
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive", "nvim-tree", "quickfix" },
      opts = function(_, opts)
        local trouble = require("trouble")
        local symbols = trouble.statusline({
          mode = "lsp_document_symbols",
          groups = {},
          title = false,
          filter = { range = true },
          format = "{kind_icon}{symbol.name:Normal}",
          -- The following line is needed to fix the background color
          -- Set it to the lualine section you want to use
          hl_group = "lualine_c_normal",
        })
        table.insert(opts.sections.lualine_c, {
          symbols.get,
          cond = symbols.has,
        })
      end,
    })
  end,
}
