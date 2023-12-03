-- Vim options file

-- Relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
-- Tabstop sets the width of a tab character
vim.opt.tabstop = 4
vim.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Smart indentation
vim.opt.smartindent = true

-- Wrap the text when they overflow
vim.opt.wrap = true

-- Break line at predefined characters
vim.opt.linebreak = true

-- Indent when the text is wrapped
vim.opt.breakindent = true

-- Indent an additional 2 characters on wrapped lines
-- When the line is more than or equal to 40 characters
-- Put 'showbreak' at the start of the line
vim.opt.breakindentopt = { shift = 2, min = 40, sbr = true }

-- The 'showbreak' character
vim.opt.showbreak = "↪"

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable smart case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Error bells
vim.opt.errorbells = false
vim.opt.visualbell = false

-- Scroll offset from the bottom
vim.opt.scrolloff = 8

-- No backups
vim.opt.backup = false
vim.opt.swapfile = false

-- Have an undo file
vim.opt.undofile = true

-- Use 24-bit colours
vim.opt.termguicolors = true

-- Always show the line that has symbols (for LSP and stuff)
vim.opt.signcolumn = "yes"

-- Faster update time
vim.opt.updatetime = 50

-- Timeout
vim.opt.timeout = true
vim.opt.timeoutlen = 500

-- Show newlines and space characters that are leading and trailing
vim.opt.list = true
vim.opt.listchars = {
    lead = "·",
    trail = "•",
    tab = "•»",
    eol = "↵",
    -- eol = "⤶",
}

-- Add more types of matching pairs
vim.opt.matchpairs:append { "<:>", "「:」", "『:』","【:】", "“:”", "‘:’", "《:》"}


-- Sets the grep command in vim to use ripgrep if it's available
if vim.fn.executable("rg") == 1 then
    vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
    vim.opt.grepformat = "%f:%l:%c:%m"
end

