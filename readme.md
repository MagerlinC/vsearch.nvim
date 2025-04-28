# Visual Search plugin

Small plugin to search for the current visual text selection globally in the project using Telescope.

## Installation & Configuration

To set up the plugin, simply require the package and supply a an option object with a `keymap` property, containing the keymap you'd like to use to conduct visual search:
```lua
return {
  "magerlinc/vsearch.nvim",
  config = function()
    require("vsearch").setup({
	keymap = "<leader>vs",
    })
  end,
}
```
