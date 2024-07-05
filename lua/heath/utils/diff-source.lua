return function()
  if vim.fn.exists('*sy#repo#get_stats') == 1 then
    local stats = vim.fn['sy#repo#get_stats']()
    return {
      added = stats[1],
      modified = stats[2],
      removed = stats[3],
    }
  end
end
