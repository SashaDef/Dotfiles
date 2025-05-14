require("alex.core.options")
require("alex.core.keymaps")

vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
    }, 
  },
  root_markers = { '.git', },
})

