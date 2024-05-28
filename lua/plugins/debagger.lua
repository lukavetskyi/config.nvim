return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    local dap = require('dap')
    local dapui = require("dapui")

    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    dap.adapters.codelldb = {
      type = 'server',
      port = "${port}",
      executable = {
        command = '/usr/bin/codelldb',
        args = { "--port", "${port}" },

      }
    }

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = function()
          local args_string = vim.fn.input('Arguments: ')
          return vim.split(args_string, " +")
        end,
      },
    }
    dap.configurations.c = dap.configurations.cpp
  end

}

-- yay -S codelldb-bin
