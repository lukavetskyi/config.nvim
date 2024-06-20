-- yay -S codelldb-bin

local function debug_config_program()
  local f = io.open("debug.nvim.txt", 'r')
  if f ~= nil then
    local r = f:lines()()
    f:close()
    return r
  else
    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  end
end

local function debug_config_args()
  local f = io.open("debug.nvim.txt", 'r')
  if f ~= nil then
    local i = f:lines()
    i()
    local r = i()
    f:close()
    return vim.split(r or "", " +")
  else
    local args_string = vim.fn.input('Arguments: ')
    return vim.split(args_string, " +")
  end
end

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
      program = debug_config_program,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = debug_config_args,
    },
  }
  dap.configurations.c = dap.configurations.cpp
end
