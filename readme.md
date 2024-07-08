# my nvim config

## todo

- replace nvim-surround with something else, may be mini surround
- finish adding LSP keymappings
- more centralized way to add language facilities (treesitter, lsp, dap)
- try for drop in dap configuration, like plugins

## mini.hipatterns / tokyonight
using these two in conjunction to copy an effect from folke that adds color
pips to symbols. either clean it up or keep an eye out for it shipping as
a feature in mini.hipatterns.

### custom lualine lsp component
right now there's a function to display the info but id like to do something
a bit more complete. real lualine components, as found [here](https://github.com/nvim-lualine/lualine.nvim/tree/master/lua/lualine/components)
are not trivial, though one could probably be copied as a basis.

desired features:
- green when lsp attached
- stretch feature: red if lsp for buffer filetype present, but lsp not attached
- default on_click that will execute `:LspInfo`
- options
    - hide_icon
    - hide_client

### issue when closing buffer
if you have nvim-tree open and class an open buffer, even if you have other bufferlines open, it
will make nvim-tree the full window buffer. there are various fixes on the internet, i haven't been
smart enough to get one to work yet.
