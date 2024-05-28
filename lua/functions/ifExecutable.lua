return function(command, fun, opts)
  if vim.fn.executable(command) then
    fun(opts)
  end
end
