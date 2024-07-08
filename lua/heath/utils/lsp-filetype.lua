local M = {}

M.version = vim.version().minor
M.icon = " "
M.alt_icon = " "

-- local label = "LSP"
M.is_lsp_attached = function()
  local stbufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
  if rawget(vim, "lsp") and M.version >= 10 then
    for _, client in ipairs(vim.lsp.get_clients()) do
      if client.attached_buffers[stbufnr] then
        return true
      end
    end
  end
  return false
end

M.render = function()
  if M.is_lsp_attached() then
    return M.icon
  end
  return ""
end

return M
