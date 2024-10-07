-- Bufferline configuration

-- Gets the module with the utilities
local utils = require("utils")

-- Returns the bufferline plugin for lazy.nvim
return {
    "akinsho/bufferline.nvim",
    version = "*",
    cond = utils.firenvim_not_active,
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            numbers = "buffer_id",
            close_command = function(bufnr)
                require("mini.bufremove").delete(bufnr)
            end,
            right_mouse_command = function(bufnr)
                require("mini.bufremove").delete(bufnr)
            end,
            separator_style = "slant",
            offsets = {
                { filetype = "NvimTree", text = "File Explorer" },
                { filetype = "undotree", text = "Undo Tree" },
                { filetype = "aerial", text = "Aerial" },
            },
        },
    },
    keys = {

        -- Goes to the file buffer on the right
        {
            "<Leader>l",
            vim.cmd.BufferLineCycleNext,
            mode = "n",
            desc = "Goes to the next buffer",
        },

        -- Goes to the file buffer on the left
        {
            "<Leader>h",
            vim.cmd.BufferLineCyclePrev,
            mode = "n",
            desc = "Goes to the next buffer",
        },

        -- Moves the current file buffer to the right
        {
            "<Leader>bl",
            vim.cmd.BufferLineMoveNext,
            mode = "n",
            desc = "Moves the current buffer to the right",
        },

        -- Moves the current file buffer to the left
        {
            "<Leader>bh",
            vim.cmd.BufferLineMovePrev,
            mode = "n",
            desc = "Moves the current buffer to the left",
        },

        -- Deletes all file buffers to the right of the current buffer
        {
            "<Leader>bdl",
            vim.cmd.BufferLineCloseRight,
            mode = "n",
            desc = "Deletes all buffers to the right of the current buffer",
        },

        -- Moves the current file buffer on the left of the current buffer
        {
            "<Leader>bdh",
            vim.cmd.BufferLineCloseLeft,
            mode = "n",
            desc = "Deletes all buffers to the left of the current buffer",
        },
    },
}
