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

    vim.api.nvim_create_autocmd("QuitPre", {
      callback = function()
        local tree_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
          local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
          if bufname:match("NvimTree_") ~= nil then
            table.insert(tree_wins, w)
          end
          if vim.api.nvim_win_get_config(w).relative ~= '' then
            table.insert(floating_wins, w)
          end
        end
        if 1 == #wins - #floating_wins - #tree_wins then
          -- Should quit, so we close all invalid windows.
          for _, w in ipairs(tree_wins) do
            vim.api.nvim_win_close(w, true)
          end
        end
      end
    })
  end
}
