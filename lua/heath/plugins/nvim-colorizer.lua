return {
  "NvChad/nvim-colorizer.lua",
  -- "norcalli/nvim-colorizer.lua",
  events = { "User FilePost", "BufEnter" },
  config = function(_, opts)
    local colorizer = require("colorizer")
    colorizer.setup(opts)

    -- execute colorizer as soon as possible
    vim.defer_fn(function()
      colorizer.attach_to_buffer(0)
    end, 0)
  end
}
