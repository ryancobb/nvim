return {
  {
    "microsoft/vscode-js-debug",
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    opts = {
      debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
      adapters = { "pwa-node", "pwa-chrome" },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      dap.configurations.javascript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Debug Jest Tests",
          runtimeExecutable = "node",
          runtimeArgs = {
            "--inspect-brk",
            "./node_modules/jest/bin/jest.js",
            "--runInBand",
            "--runTestsByPath",
            "${file}",
          },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
        },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = true,
  },
}
