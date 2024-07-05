-- surround text with special characters
return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*",
  config = true,
  opts = {}
}
