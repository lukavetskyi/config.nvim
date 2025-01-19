return function()
  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      if vim.fn.expand('%:t') == "docker-compose.yml" then
        vim.cmd(":set filetype=yaml.docker-compose")
      end
    end
  })
end
