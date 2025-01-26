-- debugpy
return {
  "mfussenegger/nvim-dap-python",
  event = "VeryLazy",
  lazy=true,
  depedencies = { "mfussenegger/nvim-dap" },
  config = function()
    require("dap-python").setup("python3")
  end
}

