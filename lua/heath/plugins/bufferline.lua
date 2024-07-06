return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
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
      ["<S-tab>"] = { "<cmd>bprev<CR>", "Prev Tab" },
      ["<tab>"] = { "<cmd>bnext<CR>", "Next Tab" },
    })
  end,
}
