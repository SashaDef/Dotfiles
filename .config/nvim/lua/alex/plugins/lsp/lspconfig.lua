return{
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" }},
          },
        },
      },
    },
    config = function()
      vim.diagnostic.config({
        virual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = true
      })
      require("lspconfig").rust_analyzer.setup {}
      require("lspconfig").lua_ls.setup {}
      require("lspconfig").pyright.setup {}
    end
  }
}
