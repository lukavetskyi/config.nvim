return function()
  vim.keymap.set("i", "<C-m>", function()
    vim.ui.input({ prompt = "💻 Calculator: " }, function(input)
      local calc = load("return " .. (input or ""))()
      if (calc) then
        vim.api.nvim_feedkeys(tostring(calc), "i", true)
      end
    end)
  end)
end
