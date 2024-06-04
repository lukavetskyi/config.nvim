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
    local ifExecutable = require('functions.ifExecutable')
    local formatOnSave = require('functions.formatOnSave')

    -- pkg install lua-language-server
    --
    -- pacman -S lua-language-server
    ifExecutable('lua-language-server', lspconfig.lua_ls.setup, {
      capabilities = capabilities,
      on_attach = formatOnSave('*.lua')
    })

    -- npm install -g typescript typescript-language-server
    ifExecutable('typescript-language-server', lspconfig.tsserver.setup, {
      capabilities = capabilities,
      on_attach = formatOnSave({ "*.js", "*.jsx", "*.ts", "*.tsx" })
    })

    -- npm i -g vscode-langservers-extracted
    ifExecutable('vscode-html-language-server', lspconfig.html.setup, {
      capabilities = capabilities,
      on_attach = formatOnSave('*.html')
    })

    -- npm i -g vscode-langservers-extracted
    ifExecutable('vscode-css-language-server', lspconfig.cssls.setup, {
      capabilities = capabilities,
      on_attach = formatOnSave({ '*.css', '*.scss' })
    })

    -- npm i -g vscode-langservers-extracted
    ifExecutable('vscode-eslint-language-server', lspconfig.eslint.setup, {
      capabilities = capabilities,
    })

    -- npm i -g vscode-langservers-extracted
    ifExecutable('vscode-json-language-server', lspconfig.jsonls.setup, {
      capabilities = capabilities,
      on_attach = formatOnSave('*.json')
    })

    -- npm install -g emmet-ls
    ifExecutable('emmet-ls', lspconfig.emmet_ls.setup, {
      capabilities = capabilities
    })

    -- pkg install clang
    --
    -- pacman -S clang
    ifExecutable('clangd', lspconfig.clangd.setup, {
      capabilities = capabilities,
      on_attach = formatOnSave({ "*.c", "*.h", "*.cpp", "*.hpp" })
    })

    -- npm install -g dockerfile-language-server-nodejs
    ifExecutable('dockerfile-langserver', lspconfig.dockerls.setup, {
      capabilities = capabilities,
    })

    -- npm install @microsoft/compose-language-service
    ifExecutable('docker-compose-langserver', lspconfig.docker_compose_language_service.setup, {
      capabilities = capabilities,
    })

    -- yay -S autotools-language-server
    ifExecutable('autotools-language-server', lspconfig.autotools_ls.setup, {
      capabilities = capabilities
    })

    -- yay -S cmake-language-server
    ifExecutable('cmake-language-server', lspconfig.cmake.setup, {
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
