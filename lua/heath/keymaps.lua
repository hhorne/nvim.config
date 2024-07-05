local M = {}

M.n = {
  -- clear search highlight
  ["<Esc>"] = { "<cmd>nohlsearch<CR>", "Clear Search Highlight" },
  -- split buffers
  ["<leader>s"] = {
    name = "[S]plit",
    v = { "<C-w>v", "[S]plit [V]ertically" },
    h = { "<C-w>s", "[S]plit [H]orizontally" },
    x = { "<cmd>close<CR>", "[S]plit [X]Close" },
  },
  ["<M-,>"] = { "<c-w>5<", "Alt + , Vertical Split Resize" },
  ["<M-.>"] = { "<c-w>5>", "Alt + . Vertical Split Resize" },
  ["<M-t>"] = { "<C-W>+", "Alt + t Horizontal Split Resize" },
  ["<M-s>"] = { "<C-W>-", "Alt + s Horizontal Split Resize" },
  ["<leader>c"] = {
    name = "[C]ode",
    ["/"] = { "gcc", "[C]ode [/]Comment", remap = true },
  },
}

-- Couldn't figure out how to get this to work! Pressing <leader> (space in my config)
-- just leads to the VISUAL mode selection advancing to the next character. I would
-- expect it to open the whichkey menu.
--
-- M.v = {
--   ["<leader>"] = {
--     ["c/"] = { "gc", "[C]ode [/]Comment", remap = true },
--   },
-- }

vim.keymap.set("v", "<leader>c/", "gc", { desc = "[C]ode [/]Comment Toggle", remap = true })

return M
