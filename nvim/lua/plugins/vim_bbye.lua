-- Configuration for vim-bbye
-- Which is a plugin to delete buffers without messing up the layout

-- Closes the current buffer
vim.keymap.set("n", "<Leader>x", function() vim.cmd("Bdelete!") end, { desc = "Closes the current buffer" })

-- Returns the vim-bbye module for lazy.nvim
return {
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
    lazy = true
}
