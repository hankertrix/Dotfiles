# Neovim Configuration

## Plugins

Plugin manager -
[lazy.nvim](https://github.com/folke/lazy.nvim)

### Appearance

Theme -
[bluloco.nvim](https://github.com/uloco/bluloco.nvim)

Statusline -
[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

### Integrations

Git integration -
[Neogit](https://github.com/NeogitOrg/neogit)

Git gutter plugin (to show the changes at the side while editing a file) -
[gitsign.nvim](https://github.com/lewis6991/gitsigns.nvim)

Using neovim in the browser -
[firenvim](https://github.com/glacambre/firenvim)

### Coding

LSP -
[lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)
with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

LSP integration with linters and formatters -
[none-ls (null-ls)](https://github.com/nvimtools/none-ls.nvim)
with [mason-null-ls](https://github.com/jay-babu/mason-null-ls.nvim)
for integration with [mason.nvim](https://github.com/williamboman/mason.nvim)

Language server manager -
[mason.nvim](https://github.com/williamboman/mason.nvim)
with [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)

Diagnostics -
[trouble.nvim](https://github.com/folke/trouble.nvim)

Autocompletion -
[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

Autocompletion sources:

- [cmp-async-path](https://codeberg.org/FelipeLema/cmp-async-path)
- [cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-treesitter](https://github.com/ray-x/cmp-treesitter)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [cmp-calc](https://github.com/hrsh7th/cmp-calc)
- [cmp-spell](https://github.com/f3fora/cmp-spell)
- [cmp-emoji](https://github.com/hrsh7th/cmp-emoji)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [cmp-cmdline-history](https://github.com/dmitmel/cmp-cmdline-history)
- [cmp-nvim-lsp-document-symbol](https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol)

AI autocompletion sources:

- [supermaven.nvim](https://github.com/supermaven-inc/supermaven-nvim)
- [cmp-tabnine](https://github.com/tzachar/cmp-tabnine)

Snippet engine -
[LuaSnip](https://github.com/L3MON4D3/LuaSnip)

Snippets -
[friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

Treesitter -
[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Treesitter text objects -
[nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)

Surroundings editor -
[nvim-surround](https://github.com/kylechui/nvim-surround)

Document symbol viewer -
[aerial.nvim](https://github.com/stevearc/aerial.nvim)

Function arguments highlighting -
[hlargs.nvim](https://github.com/m-demare/hlargs.nvim)

Indent highlighting -
[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

Auto pairing -
[nvim-autopairs](https://github.com/windwp/nvim-autopairs)

Mass commenting -
[Comment.nvim](https://github.com/numToStr/Comment.nvim)

Same word highlighting -
[vim-illuminate](https://github.com/RRethy/vim-illuminate)

Highlighting and removing trailing spaces and new lines -
[mini.trailspace](https://github.com/echasnovski/mini.trailspace)

### Managing files

Marking files for quick access -
[Arrow.nvim](https://github.com/otavioschwanck/arrow.nvim)

File explorer -
[yazi.nvim](https://github.com/mikavilpas/yazi.nvim)

Fuzzy finder -
[fzf-lua](https://github.com/ibhagwan/fzf-lua)

Telescope extensions:

- [trouble.nvim](https://github.com/folke/trouble.nvim)

### Helpers

Properly close buffers -
[mini.bufremove](https://github.com/echasnovski/mini.bufremove)

Helper for key bindings -
[which-key.nvim](https://github.com/folke/which-key.nvim)

Undo history viewer -
[undotree](https://github.com/mbbill/undotree)

Markdown previewer -
[markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

Hide the colour column when not needed -
[smartcolumn.nvim](https://github.com/m4xshen/smartcolumn.nvim)

### Building better Vim habits

VimBeGood game -
[vim-be-good](https://github.com/ThePrimeagen/vim-be-good)

Hardtime plugin -
[hardtime.nvim](https://github.com/m4xshen/hardtime.nvim)

### Font

[Cascadia Code Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode)

### External programs

- [ripgrep (for searching within files)](https://github.com/BurntSushi/ripgrep)
- [fd (for finding files)](https://github.com/sharkdp/fd)
- [fzf (for fuzzy finding)](https://github.com/junegunn/fzf)
- [yazi (terminal file manager)](https://github.com/sxyazi/yazi)
- [python (for installing `pylsp`)](https://www.python.org/)
- [npm (for installing JavaScript ecosystem tools, like `prettierd`, `tsserver`, etc.)](https://www.npmjs.com/)
