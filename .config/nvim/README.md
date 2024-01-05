# My Neovim Configuration

## Plugins

Plugin manager - [lazy.nvim](https://github.com/folke/lazy.nvim)

### Appearance

Theme - [bluloco.nvim](https://github.com/uloco/bluloco.nvim)

Statusline - [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

Bufferline / tabline - [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

### Integrations

Git integration - [vim-fugitive](https://github.com/tpope/vim-fugitive)

Git gutter plugin (to show the changes at the side while editing a file) - [gitsign.nvim](https://github.com/lewis6991/gitsigns.nvim)

Using neovim in the browser - [firenvim](https://github.com/glacambre/firenvim)

### Coding

LSP - [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

LSP integration with linters and formatters - [none-ls (null-ls)](https://github.com/nvimtools/none-ls.nvim) with [mason-null-ls](https://github.com/jay-babu/mason-null-ls.nvim) for integration with [mason.nvim](https://github.com/williamboman/mason.nvim)

Language server manager - [mason.nvim](https://github.com/williamboman/mason.nvim) with [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)

Diagnostics - [trouble.nvim](https://github.com/folke/trouble.nvim)

Autocompletion - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

Autocompletion sources:

- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help)
- [cmp-tabnine](https://github.com/tzachar/cmp-tabnine)
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

Snippet engine - [LuaSnip](https://github.com/L3MON4D3/LuaSnip)

Snippets - [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

AI autocompletion - [codeium.nvim](https://github.com/jcdickinson/codeium.nvim)

Treesitter - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Treesitter text objects - [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)

Surroundings editor - [nvim-surround](https://github.com/kylechui/nvim-surround)

Document symbol viewer - [aerial.nvim](https://github.com/stevearc/aerial.nvim)

Function arguments highlighting - [hlargs.nvim](https://github.com/m-demare/hlargs.nvim)

Indent highlighting - [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

Auto pairing - [nvim-autopairs](https://github.com/windwp/nvim-autopairs)

Mass commenting - [Comment.nvim](https://github.com/numToStr/Comment.nvim)

Same word highlighting - [vim-illuminate](https://github.com/RRethy/vim-illuminate)

Highlighting and removing trailing spaces and new lines - [mini.trailspace](https://github.com/echasnovski/mini.trailspace)

### Managing files

Marking files for quick access - [Harpoon](https://github.com/ThePrimeagen/harpoon)

File explorer - [mini.files](https://github.com/echasnovski/mini.files)

Fuzzy finder - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) with [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)

Telescope extensions:

- [Harpoon](https://github.com/ThePrimeagen/harpoon)
- [aerial.nvim](https://github.com/stevearc/aerial.nvim)

### Helpers

Properly close buffers - [mini.bufremove](https://github.com/echasnovski/mini.bufremove)

Helper for key bindings - [which-key.nvim](https://github.com/folke/which-key.nvim)

Undo history viewer - [undotree](https://github.com/mbbill/undotree)

Markdown previewer - [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

### Miscellaneous

VimBeGood game - [vim-be-good](https://github.com/ThePrimeagen/vim-be-good)

### Font

[Cascadia Code Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode)

### External programs

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [gcc](https://gcc.gnu.org/)
- [python (for installing `pylsp`)](https://www.python.org/)
- [npm (for installing JavaScript ecosystem tools, like `prettierd`, `eslint_d`, `tsserver`, etc.)](https://www.npmjs.com/)
