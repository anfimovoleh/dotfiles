return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "DiagnosticError", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "⚡", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "❌", texthl = "DiagnosticError", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "📌", texthl = "DiagnosticInfo", linehl = "", numhl = "" })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enable_commands = false,
        commented = false,
        all_frames = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        only_first_definition = true,
        all_references = false,
        clear_on_continue = false,
        text_prefix = "🔎 ",
        separator = " ➜ ",
        error_prefix = "❗",
        info_prefix = "ℹ️",
        virt_text_pos = "eol",
        virt_lines = false,
        virt_lines_above = false,
        filter_references_pattern = "",
        display_callback = function(variable)
          return string.format("%s = %s", variable.name, variable.value)
        end,
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      dap.adapters.go = {
        type = "server",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "--listen", "127.0.0.1:${port}", "--log", "--log-output", "dap,rpc,debugger" },
        },
      }

      dap.configurations.go = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          program = "${file}",
          buildFlags = "-gcflags='all=-N -l'",
        },
        {
          type = "go",
          name = "Debug Package",
          request = "launch",
          program = "./",
          buildFlags = "-gcflags='all=-N -l'",
        },
      }

      -- Keybindings for DAP
      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end, { desc = "Continue" })
      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end, { desc = "Step Over" })
      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end, { desc = "Step Into" })
      vim.keymap.set("n", "<F12>", function()
        dap.step_out()
      end, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>b", function()
        dap.toggle_breakpoint()
      end, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Conditional Breakpoint" })
      vim.keymap.set("n", "<leader>lp", function()
        dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end, { desc = "Log Breakpoint" })
      vim.keymap.set("n", "<leader>dr", function()
        dap.repl.open()
      end, { desc = "Open Debug REPL" })
      vim.keymap.set("n", "<leader>dl", function()
        dap.run_last()
      end, { desc = "Run Last Debug Session" })
      vim.keymap.set("n", "<leader>bc", function()
        require("dap.breakpoints").clear()
      end, { desc = "Clear All Breakpoints" })
    end,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("dap")
      vim.keymap.set("n", "<leader>db", function()
        require("telescope").extensions.dap.list_breakpoints()
      end, { desc = "List Breakpoints" })
    end,
  },
}
