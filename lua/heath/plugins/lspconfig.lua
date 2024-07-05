-- programming language integration 
local get_capabilities = require("heath.utils.get-capabilities")

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },
    -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    -- on_attach set keybinds
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local telescope = require("telescope.builtin")
        local opts = { buffer = ev.buf }
        require("which-key").register({
          -- add LSP key mappings here
          ["gD"] = { telescope.lsp_definitions, "[G]oto [D]efinition", opts },
          ["gr"] = { telescope.lsp_references, "[G]et [R]eferences", opts },
          K = { vim.lsp.buf.hover, "LSP: Hover Documentation", opts },
        })
      end,
    })

    -- TODO: Split out into a separate file
    local servers = {
      gopls = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      }
    }

    require("mason").setup()
    require("mason-lspconfig").setup {
      handlers = {
        -- override config for installed lsp servers. leave language out for default setup.
        function(server_name)
          local capabilities = get_capabilities()
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end
      }
    }
  end,
}
