-- Configuration for the plugin to close a buffer
-- Current the plugin is mini.bufremove

-- Returns the close buffer plugin for lazy.nvim
return {
    "echasnovski/mini.bufremove",
    lazy = true,
    keys = {

        -- Close the current buffer with <Leader>x
        {
            "<Leader>x",
            function()
                require("mini.bufremove").delete()
            end,
            mode = "n",
            desc = "Closes the current buffer",
        },
    },
}
