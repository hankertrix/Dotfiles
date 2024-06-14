-- Bufferline configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Function to set up bufferline
local function setup()

    -- Stops executing if the package isn't installed
    if not utils.status_ok("bufferline") then return end

    -- Setup bufferline
    require("bufferline").setup({
        options = {
            numbers = "buffer_id",
            close_command = function(bufnr) require("mini.bufremove").delete(bufnr) end,
            right_mouse_command = function (bufnr) require("mini.bufremove").delete(bufnr) end,
            separator_style = "slant",
            diagnostics = "nvim_lsp",
            offsets = {
                { filetype = "NvimTree", text = "File Explorer" },
                { filetype = "undotree", text = "Undo Tree" },
                { filetype = "aerial", text = "Aerial" }
            }
        }
    })


    -- Some key maps to switch between buffers easier

    -- Goes to the file buffer on the right
    vim.keymap.set("n", "<Leader>l", vim.cmd.BufferLineCycleNext, { desc = "Goes to the next buffer" })

    -- Goes to the file buffer on the left
    vim.keymap.set("n", "<Leader>h", vim.cmd.BufferLineCyclePrev, { desc = "Goes to the next buffer" })

    -- Moves the current file buffer to the right
    vim.keymap.set("n", "<Leader>bl", vim.cmd.BufferLineMoveNext, { desc = "Moves the current buffer to the right" })

    -- Moves the current file buffer to the left
    vim.keymap.set("n", "<Leader>bh", vim.cmd.BufferLineMovePrev, { desc = "Moves the current buffer to the left" })

    -- Deletes all file buffers to the right of the current buffer
    vim.keymap.set("n", "<Leader>bdl", vim.cmd.BufferLineCloseRight, { desc = "Deletes all buffers to the right of the current buffer" })

    -- Moves the current file buffer on the left of the current buffer
    vim.keymap.set("n", "<Leader>bdh", vim.cmd.BufferLineCloseLeft, { desc = "Deletes all buffers to the left of the current buffer" })

end

-- Returns the bufferline plugin for lazy.nvim
return {
    "akinsho/bufferline.nvim",
    version = "*",
    config = setup,
    cond = utils.firenvim_not_active,
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" }
}
