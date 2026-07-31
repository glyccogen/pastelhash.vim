<h1 align="center">pastelhash.nvim</h1>
<p align="center">clear focus on what matters</p>
<details>
  <summary>Theme preview (light / dark)</summary>
  <p align="center">
    <img src="https://raw.githubusercontent.com/glyccogen/pastelhash.vim/assets/demo.svg" alt="preview" />
  </p>
</details>

## Palette

<p align="center">
  <img src="https://raw.githubusercontent.com/glyccogen/pastelhash.vim/assets/palette.svg" alt="color palette" />
</p>

## Configuration and default values

```lua
require('pastelhash').setup({
    variant = nil, -- 'light' | 'dark'; nil -> auto using vim.o.background
    deprecated_as_warn = false, -- true -> deprecated is colored as WARNING
    highlight_immutable = false, -- true -> readonly uses the literal color
    highlight_keywords = false, -- true -> keyword groups use the keyword color
})
vim.cmd.colorscheme('pastelhash')
```

Vim:

```vim
" let g:pastelhash_variant = 'light' " or 'dark'; unset -> auto by &background
let g:pastelhash_deprecated_as_warn = 0
let g:pastelhash_highlight_immutable = 0
let g:pastelhash_highlight_keywords = 0
colorscheme pastelhash
```

## Notes

* Vim support is regex-syntax based. Declaration highlighting is best-effort and language dependent.
* Neovim includes extra Treesitter highlight groups when available.
* Includes matching colors for [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim); the plugin itself must be installed separately.
* Expects truecolor (`termguicolors`).
