-- The configuration for the smart column plugin
-- Currently it's smartcolumn.nvim

-- Returns the smart column plugin for lazy.nvim
return {
    "m4xshen/smartcolumn.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {

        -- Show a line on the right that represents the maximum column width
        -- This makes it easier to keep to a character limit, usually 80
        colorcolumn = tostring(require("shared_configs").max_line_length),

        -- Disable the plugins for the filetypes below
        disabled_filetypes = {
            "help",
            "text",
            "markdown",
            "checkhealth",

            -- Plugin specific filetypes
            "lazy",
            "mason",
            "lspinfo",
            "null-ls-info",
            "fugitive",
            "gitcommit",
            "undotree",
            "aerial",
            "harpoon",
            "minifiles",
            "Trouble",
            "TelescopePrompt",
            "WhichKey",
            "NeogitStatus",
            "NeogitHelpPopup",
            "NeogitCherryPickPopup",
            "NeogitDiffPopup",
            "NeogitRemotePopup",
            "NeogitPushPopup",
            "NeogitResetPopup",
            "NeogitStashPopup",
            "NeogitBranchPopup",
            "NeogitBisectPopup",
            "NeogitCommitPopup",
            "NeogitFetchPopup",
            "NeogitLogPopup",
            "NeogitMergePopup",
            "NeogitPullPopup",
            "NeogitRebasePopup",
            "NeogitRevertPopup",
            "NeogitWorktreePopup",
            "NeogitCommitMessage",
        },
    },
}
