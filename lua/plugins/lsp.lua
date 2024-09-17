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
    -- pkg install lua-language-server
    --
    -- pacman -S lua-language-server
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

    -- pkg install clang
    --
    -- pacman -S clang
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

    -- yay -S autotools-language-server
    lspconfig.autotools_ls.setup({
      capabilities = capabilities
    })

    -- yay -S cmake-language-server
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
