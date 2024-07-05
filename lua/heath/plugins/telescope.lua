-- for displaying search results
return {
  "nvim-telescope/telescope.nvim",
  -- branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-ui-select.nvim"
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case" },
        ["ui-select"] = { require("telescope.themes").get_dropdown() },
      },
      vimgrep_argument = { "rg", "--smart-case" },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")

    require("which-key").register({
      f = {
        name = "[F]ind",
        f = { builtin.find_files, "[F]ind [F]iles" },
        r = { builtin.oldfiles, "[F]ind [R]ecent" },
        g = { builtin.live_grep, "[F]ind by [G]rep" },
        w = { builtin.grep_string, "[F]ind [W]ord under cursor in CWD" },
        t = { builtin.builtin, "[F]ind in [T]elescope functions" },
        d = { builtin.diagnostics, "[F]ind in [D]iagnostics" },
        h = { builtin.help_tags, "[F]ind in [H]elp" },
        k = { builtin.keymaps, "[F]ind in [K]eymaps" },
        o = { function() builtin.live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' } end, "[F]ind in [O]pen files" },
        n = { function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end, "[F]ind in [N]eovim files"},
      },
    }, { prefix = "<leader>" })
  end,
}
