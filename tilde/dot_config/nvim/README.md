# Neovim Configuration

## Plugins

Plugin manager -
[lazy.nvim](https://github.com/folke/lazy.nvim)

### Appearance

Theme -
[bluloco.nvim](https://github.com/uloco/bluloco.nvim)

Statusline -
[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

Auto theme switcher -
[auto-dark-mode.nvim](https://github.com/f-person/auto-dark-mode.nvim)

### Integrations

Git integration -
[Neogit](https://github.com/NeogitOrg/neogit)

Git gutter plugin (to show the changes at the side while editing a file) -
[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

Using Neovim in the browser -
[Firenvim](https://github.com/glacambre/firenvim)

### Coding

LSP - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

LSP integration with linters and formatters -
[none-ls (null-ls)](https://github.com/nvimtools/none-ls.nvim)
with [mason-null-ls](https://github.com/jay-babu/mason-null-ls.nvim)
for integration with [mason.nvim](https://github.com/williamboman/mason.nvim)

Language server manager -
[mason.nvim](https://github.com/williamboman/mason.nvim)
with [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)

Rust owl for showing lifetimes in Rust -
[rustowl](https://github.com/cordx56/rustowl)

Diagnostics -
[trouble.nvim](https://github.com/folke/trouble.nvim)

Autocompletion -
[blink.cmp](https://github.com/Saghen/blink.cmp)

Autocompletion sources:

- [blink.compat (compatibility layer for nvim-cmp sources)](https://github.com/Saghen/blink.compat)
- [cmp-calc](https://github.com/hrsh7th/cmp-calc)
- [blink-cmp-spell](https://github.com/ribru17/blink-cmp-spell)
- [blink-emoji.nvim](https://github.com/moyiz/blink-emoji.nvim)

AI autocompletion sources:

- [supermaven.nvim](https://github.com/supermaven-inc/supermaven-nvim)
- [cmp-tabnine](https://github.com/tzachar/cmp-tabnine)

Snippet engine -
[LuaSnip](https://github.com/L3MON4D3/LuaSnip)

Snippets -
[friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

Treesitter -
[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Context viewer -
[nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)

Surroundings editor -
[nvim-surround](https://github.com/kylechui/nvim-surround)

Function arguments highlighting -
[hlargs.nvim](https://github.com/m-demare/hlargs.nvim)

Auto pairing -
[nvim-autopairs](https://github.com/windwp/nvim-autopairs)

Same word highlighting -
[vim-illuminate](https://github.com/RRethy/vim-illuminate)

Highlighting and removing trailing spaces and new lines -
[mini.trailspace](https://github.com/echasnovski/mini.trailspace)

Guessing indentation -
[vim-sleuth](https://github.com/tpope/vim-sleuth)

Better quick fix list -
[quicker.nvim](https://github.com/stevearc/quicker.nvim)

### Managing files

File explorer -
[yazi.nvim](https://github.com/mikavilpas/yazi.nvim)

### Helpers

Quality of life plugin - [snacks.nvim](https://github.com/folke/snacks.nvim)

- Dealing with big files ([Snacks.bigfile](https://github.com/folke/snacks.nvim/blob/main/docs/bigfile.md))
- Opening files as quick as possible ([Snacks.quickfile](https://github.com/folke/snacks.nvim/blob/main/docs/quickfile.md))
- Nicer looking status column ([Snacks.statuscolumn](https://github.com/folke/snacks.nvim/blob/main/docs/statuscolumn.md))
- Nicer looking input prompt ([Snacks.input](https://github.com/folke/snacks.nvim/blob/main/docs/input.md))
- Image viewer ([Snacks.image](https://github.com/folke/snacks.nvim/blob/main/docs/image.md))
- Fuzzy finder ([Snacks.picker](https://github.com/folke/snacks.nvim/blob/main/docs/picker.md))
- Highlighting indentation ([Snacks.indent](https://github.com/folke/snacks.nvim/blob/main/docs/indent.md))
- Properly closing buffers ([Snacks.bufdelete](https://github.com/folke/snacks.nvim/blob/main/docs/bufdelete.md))

Helper for key bindings -
[which-key.nvim](https://github.com/folke/which-key.nvim)

Undo history viewer -
[undotree](https://github.com/mbbill/undotree)

Markdown previewer -
[markview.nvim](https://github.com/OXY2DEV/markview.nvim)

Help file previewer -
[helpview.nvim](https://github.com/OXY2DEV/helpview.nvim)

Hide the colour column when not needed -
[nerd_column.nvim](https://github.com/hankertrix/nerd_column.nvim)

### Building better Vim habits

VimBeGood game -
[vim-be-good](https://github.com/ThePrimeagen/vim-be-good)

Nvim-training plugin -
[nvim-training](https://github.com/Weyaaron/nvim-training)

Hardtime plugin to force me to use more efficient Vim motions -
[hardtime.nvim](https://github.com/m4xshen/hardtime.nvim)

### Miscellaneous

Typr typing plugin -
[typr][https://github.com/nvzone/typr]

## Font

[Maple Mono NF CN](https://github.com/subframe7536/maple-font)

## External programs

### Language servers

The language servers below are shared with my Emacs configuration,
so they are installed globally on my system instead of through Mason.

- [efm-langserver](https://aur.archlinux.org/packages/efm-langserver)
- [ltex-plus](https://aur.archlinux.org/packages/ltex-ls-plus-bin)
- [basedpyright](https://aur.archlinux.org/packages/basedpyright)

### Formatters and linters

The formatters and linters below are also shared with my Emacs configuration,
so they are installed globally on my system instead of through Mason.

- [Ruff](https://github.com/astral-sh/ruff)

### Miscellaneous

- [ripgrep (for searching within files)](https://github.com/BurntSushi/ripgrep)
- [fd (for finding files)](https://github.com/sharkdp/fd)
- [fzf (for fuzzy finding)](https://github.com/junegunn/fzf)
- [yazi (terminal file manager)](https://github.com/sxyazi/yazi)
- [npm (for installing JavaScript ecosystem tools, like `prettierd`, `tsserver`, etc.)](https://www.npmjs.com/)
