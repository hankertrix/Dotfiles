-- Auto commands to run

-- Create the auto command group to highlight on yank
local highlight_yank_augroup =
    vim.api.nvim_create_augroup("HighlightOnYank", { clear = true })

-- Create the auto command to highligh on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    group = highlight_yank_augroup,
    desc = "Highlight yanked text",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 150,
        })
    end,
})
