return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'hrsh7th/cmp-nvim-lsp',
      lazy = true
    },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }

    -- jdtls
    lspconfig.jdtls.setup({
      capabilities = capabilities,
    })

    -- pyright
    -- lspconfig.pyright.setup({
      -- capabilities = capabilities,
    -- })

    -- python-lsp-server python-rope python-pyflakes python-mccabe python-pycodestyle python-pydocstyle autopep8 flake8 python-pylint
    require 'lspconfig'.pylsp.setup {
      settings = {
        pylsp = {
          plugins = {
            autopep8 = { enabled = true },
            flake8 = { enabled = true },
            -- pydocstyle = { enabled = true, ignore = {"D100", "D103"} },
            pylint = { enabled = true , args = "--errors-only"},
          }
        }
      }
    }

    -- lua-language-server
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })

    -- npm install -g typescript typescript-language-server
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })

    -- npm i -g vscode-langservers-extracted
    lspconfig.html.setup({
      capabilities = capabilities,
    })

    -- npm i -g vscode-langservers-extracted
    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

    -- npm i -g vscode-langservers-extracted
    lspconfig.eslint.setup({
      capabilities = capabilities,
    })

    -- npm i -g vscode-langservers-extracted
    lspconfig.jsonls.setup({
      capabilities = capabilities,
    })

    -- npm install -g emmet-ls
    lspconfig.emmet_ls.setup({
      capabilities = capabilities
    })

    -- clang
    lspconfig.clangd.setup({
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--clang-tidy",
      },
    })

    -- npm install -g dockerfile-language-server-nodejs
    lspconfig.dockerls.setup({
      capabilities = capabilities,
    })

    -- npm install @microsoft/compose-language-service
    lspconfig.docker_compose_language_service.setup({
      capabilities = capabilities,
    })

    -- autotools-language-server
    lspconfig.autotools_ls.setup({
      capabilities = capabilities
    })

    -- cmake-language-server
    lspconfig.cmake.setup({
      capabilities = capabilities
    })


    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
      }
    )
  end,
  lazy = false,
}
