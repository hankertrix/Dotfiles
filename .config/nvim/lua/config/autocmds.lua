-- Auto commands to run

-- Highlight yanked region
vim.cmd([[
    augroup highlight_yank
        autocmd!
            au TextYankPost * silent! lua vim.highlight.on_yank { higroup = "IncSearch", timeout = 150 }
    augroup END
]])

-- Automatically trim whitespace and blank lines on save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local mini_trailspace = require("mini.trailspace")
        mini_trailspace.trim()
        mini_trailspace.trim_last_lines()
    end,
})
