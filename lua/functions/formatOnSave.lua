return function(pattern)
  return function()
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = pattern,
      callback = function()
        vim.lsp.buf.format()
        vim.cmd(":write")
      end
    })
  end
end
