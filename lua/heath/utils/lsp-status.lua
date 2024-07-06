local version = vim.version().minor

return function()
  if rawget(vim, "lsp") and version >= 10 then
    for _, client in ipairs(vim.lsp.get_clients()) do
      local stbufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
      if client.attached_buffers[stbufnr] then
        return (vim.o.columns > 100 and " ~   LSP") or "   LSP"
      end
    end
  end

  return ""
end
