-- display for quickly reading and navigating diagnostic
-- issues and comments left by developers
local vcmd = function(cmd_str)
  return "<cmd>" .. cmd_str .. "<CR>"
end

return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {},
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    require("which-key").register({
      ["<leader>t"] = {
        name = "[T]rouble",
        t = { vcmd "Trouble diagnostics toggle", "[T]trouble [T]oggle View" },
      }
    })
  end,
}
