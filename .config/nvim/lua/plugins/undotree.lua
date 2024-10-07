-- Undotree configuration

-- Returns the undotree plugin for lazy.nvim
return {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    lazy = true,
    keys = {

        -- Keybind to toggle the undotree window
        {
            "<Leader>u",
            vim.cmd.UndotreeToggle,
            mode = "n",
            desc = "Toggles the undo tree window",
        },
    },
}
