-- automatically install Mason packages
return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = {
      "lua-language-server",
      "stylua",
      "vim-language-server",
      "bash-language-server",
      "powershell-editor-services",
      "cmake-language-server",
      "dockerfile-language-server",
      "docker-compose-language-service",
      "taplo",
      "yaml-language-server",
      "marksman",
      "html-lsp",
      "htmx-lsp",
      "css-lsp" ,
      "css-variables-language-server",
      "cssmodules-language-server",
      "some-sass-language-server",
      "tailwindcss-language-server",
      "emmet-language-server",
      "json-lsp",
      "typescript-language-server",
      "sqlls",
      "clangd",
      "csharp-language-server",
      "rust-analyzer",
      "gopls",
      "zls", -- zig
      "python-lsp-server",
      -- for dap
      "delve",
      "codelldb",
      "netcoredbg",
      -- formatting
      "prettier",
    },
  },
}
