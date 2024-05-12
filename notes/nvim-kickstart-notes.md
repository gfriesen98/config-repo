# foreward

these notes are for if you have [nvim-kickstart](https://github.com/nvim-lua/kickstart.nvim) installed

config file: `$HOME/.config/nvim/init.lua`

# useful normal mode commands ill forget

- `:Telescope colorscheme`	uses Telescope to give a list of all install colour schemes

# notable keybinds ill forget and need to learn

sorted by plugin

`<leader>` = space, then the keybind (in normal mode)

## nvim-cmd (autocomplete)

- `ctrl-n`	scroll next menu selection
- `ctrl-p`	scroll previous menu selection
- `ctrl-y`	accepts the selection
- `ctrl-space`	open the autocomplete menu if it isnt open

## nvim-lspconfig

- `gd`		goto definition
- `gr`		goto references
- `gI`		goto implementation
- `<leader>D`	jump to the type of the word under ur cursor
- `<leader>ds`	fuzzy find all symbols in the current document
- `<leader>ws`	fuzzy find all symbols in the workspace
- `<leader>rn`	rename variable under the cursor
- `<leader>ca`	execute code action (for errors/suggestions etc)
- `K`		open popup that displays documentation for the word under ur cursor
- `gD`		goto definition

## conform

formatting buffer

- `<leader>f`	format buffer

## telescope

fuzzy finding

