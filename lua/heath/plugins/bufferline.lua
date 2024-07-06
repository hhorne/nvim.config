return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
        separator_style = "slant",
        groups = {
            items = {
                require('bufferline.groups').builtin.pinned:with({ icon = "" })
            }
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    })

    require("which-key").register({
      ["<tab>"] = { "<cmd>bnext<CR>", "Next Tab" },
      ["<S-tab>"] = { "<cmd>bprev<CR>", "Prev Tab" },
      ["<leader>bp"] = { "<cmd>BufferLineTogglePin<CR>", "[B]uffer [P]in" },
    })
  end,
}
