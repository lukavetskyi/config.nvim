return function()
  local P = require("additions.help.pages")

  local function update_window(buf, page)
    if P.pages[page] then
      vim.api.nvim_buf_set_option(buf, "modifiable", true)
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, P.pages[page])
      vim.api.nvim_buf_set_option(buf, "modifiable", true)
    end
  end

  local function open_help_window()
    P.current_page = 1

    local buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, P.pages[P.current_page])
    vim.api.nvim_buf_set_option(buf, "modifiable", false)

    local width = 50
    local height = math.floor(vim.o.lines * 0.9)
    local opts = {
      relative = "editor",
      width = width,
      height = height,
      col = math.floor((vim.o.columns - width) / 2),
      row = math.floor((vim.o.lines - height) / 2),
      style = "minimal",
      border = "rounded"
    }

    vim.api.nvim_open_win(buf, true, opts)

    vim.api.nvim_buf_set_keymap(buf, "n", "h", "", {
      noremap = true,
      silent = true,
      callback = function()
        if P.current_page > 0 then
          P.current_page = P.current_page - 1
        else
          P.current_page = #P.current_page
        end
        update_window(buf, P.current_page)
      end,
    })

    vim.api.nvim_buf_set_keymap(buf, "n", "l", "", {
      noremap = true,
      silent = true,
      callback = function()
        if P.current_page < #P.pages then
          P.current_page = P.current_page + 1
        else
          P.current_page = 1
        end
        update_window(buf, P.current_page)
      end,
    })
  end

  vim.keymap.set("n", "<leader>help", open_help_window)
end
