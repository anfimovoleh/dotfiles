return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Configure LSP servers
      lspconfig["bashls"].setup({})
      lspconfig["clangd"].setup({})
      lspconfig["cssls"].setup({})
      lspconfig["docker_compose_language_service"].setup({})
      lspconfig["dockerls"].setup({})
      lspconfig["eslint"].setup({})
      lspconfig["html"].setup({})
      lspconfig["lemminx"].setup({})
      lspconfig["lua_ls"].setup({})
      lspconfig["marksman"].setup({})
      lspconfig["pyright"].setup({})
      lspconfig["solargraph"].setup({})
      lspconfig["tailwindcss"].setup({})
      lspconfig["ts_ls"].setup({})
      lspconfig["yamlls"].setup({})
      lspconfig["clangd"].setup({})
      lspconfig["helm_ls"].setup({})
      lspconfig["gopls"].setup({
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            env = {
              GOFLAGS = "-tags=windows,linux,unittest,integration,unit",
            },
          },
        },
      })

      -- LSP hover window UI tweaks
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
      })

      -- LSP diagnostics
      vim.diagnostic.config({
        float = { border = "single" },
        underline = true,
        virtual_text = false,
        virtual_lines = false,
      })

      -- Key bindings to be set after LSP attaches to buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          vim.api.nvim_buf_set_option(ev.buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
          vim.api.nvim_buf_set_option(ev.buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")

          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

          -- Custom key mappings
          vim.keymap.set("n", "<C-A-Left>", "<C-o>", opts) -- Go back
          vim.keymap.set("n", "<C-A-Right>", "<C-i>", opts) -- Go forward
        end,
      })
    end,
  },
}
