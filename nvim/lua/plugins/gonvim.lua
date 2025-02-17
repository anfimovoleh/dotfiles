return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        dap_debug = true,
        dap_debug_gui = true,
      })

      -- Configure autocommands for gofmt and goimports on save
      local group = vim.api.nvim_create_augroup("GoFmt", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        pattern = "*.go",
        callback = function()
          -- Run both goimports and gofmt
          vim.cmd("silent! lua vim.lsp.buf.format({ async = false })")
          vim.cmd("silent! GoImports")
        end,
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
