-- register and display keybinds
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")
    local keymaps = require("heath.keymaps")

    for mode, mappings in pairs(keymaps) do
      wk.register({ mappings, { mode = mode } })
    end
  end
}
