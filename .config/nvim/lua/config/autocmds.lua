-- Auto commands to run

-- Create the auto command to highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
    desc = "Highlight yanked text",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 150,
        })
    end,
})

-- Create the auto command to resize splits
-- when the terminal window is resized
vim.api.nvim_create_autocmd("VimResized", {
    group = vim.api.nvim_create_augroup("EqualiseSplits", { clear = true }),
    desc = "Resize splits with terminal window",
    callback = function()
        --

        -- Get the current tab
        local current_tab = vim.api.nvim_get_current_tabpage()

        -- Resize the tab
        vim.cmd("tabdo wincmd =")

        -- Set the current tab back to the initial tab
        vim.api.nvim_set_current_tabpage(current_tab)
    end,
})

-- Create the auto command to restore cursor to
-- file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("RestoreCursor", { clear = true }),
    desc = "Restore cursor to file position in previous editing session",
    callback = function(args)
        --

        -- Get the row position of the cursor
        -- in the current buffer
        -- from the previous editing session
        local row_position = unpack(vim.api.nvim_buf_get_mark(args.buf, '"'))

        -- Get the number of lines in the buffer
        local line_count = vim.api.nvim_buf_line_count(args.buf)

        -- If the row position is greater than zero
        -- and also less than or equal to the
        -- number of lines in the buffer,
        -- move the cursor to the row position
        if row_position > 0 and row_position <= line_count then
            vim.cmd('normal! g`"zz')
        end
    end,
})
