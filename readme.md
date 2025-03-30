# Visual Search plugin

Small plugin to search for the current visual text selection globally in the project using Telescope.


## Configuration


To set up the plugin, simply supply a an option object with a `keymap` property, containing the keymap you'd like to use to search:
```lua
return {
  "vsearch",
  config = function()
    require("vsearch").setup({
        keymap = "<leader>sh",
    })
  end,
}
```
