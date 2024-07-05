-- file tree explorer
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- nvim-tree specific keymaps
    require("which-key").register({
      ["<C-n>"] = { "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer" },
      ["<leader>e"] = {
        name = "[E]xplore",
        c = { "<cmd>NvimTreeFindFileToggle<CR>", "[E]xplore to [C]urrent file" },
        r = { "<cmd>NvimTreeRefresh<CR>", "[E]xplore [R]efresh" },
        f = { "<cmd>NvimTreeFocus<CR>", "[E]xplore [F]ocus" },
        ["-"] = { "<cmd>NvimTreeCollapse<CR>", "[E]xplore [-]Collapse all nodes" },
      },
    })

    nvimtree.setup({
      view = {
        width = 35,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "󰈚",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "✗",
              staged = "",
              unmerged = "",
              renamed = "",
              untracked = "",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false
      },
    })
  end
}
