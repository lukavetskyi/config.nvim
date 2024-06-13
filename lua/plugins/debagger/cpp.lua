-- yay -S codelldb-bin

return function(dap)
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
