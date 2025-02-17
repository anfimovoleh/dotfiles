return {
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  {
    "theHamsta/nvim-dap-virtual-text",
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
    end,
  },
}
