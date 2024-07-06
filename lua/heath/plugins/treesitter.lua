-- syntax highlighting for languages
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    local autotag = require("nvim-ts-autotag")

    autotag.setup({
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    })

    treesitter.setup({
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "csv",
        "bash",
        "fish",
        "regex",
        "udev",
        "make",
        "cmake",
        "dockerfile",
        "gitignore",
        "git_config",
        "yaml",
        "toml",
        "xml",
        "markdown",
        "markdown_inline",
        "html",
        "css",
        "scss",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "sql",
        "c",
        "cpp",
        "c_sharp",
        "rust",
        "go",
        "python",
        "gleam",
        "zig",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end
}
