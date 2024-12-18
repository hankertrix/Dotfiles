-- Configuration for the remaps

-- Sets the leader key to space
vim.g.mapleader = " "


-- Key remaps

-- Allows me to move lines up and down in visual mode
-- using the J and K keys
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines down" })

-- Remap the Netrw refresh to F5 instead of Ctrl + l
-- so I can use Ctrl + l to move between screens in Netrw
vim.keymap.set("n", "<F5>", "<Plug>NetrwRefresh", { desc = "Refresh Netrw" })

-- Use Ctrl + hjkl to move between splits
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the window on the left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to the window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to the window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to the window on the right" })

-- Key maps to change buffers
vim.keymap.set("n", "<Leader>l", vim.cmd.bnext, { desc = "Go to the next buffer" })
vim.keymap.set("n", "<Leader>h", vim.cmd.bprevious, { desc = "Go to the previous buffer" })

-- Title case the hovered word
vim.keymap.set("i", "<C-t>", "<Esc>b~lea", { desc = "Titlecase hovered word" })

-- Centers the screen every time I page
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a screen" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a screen" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll N screens forward" })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Scroll N screens backward" })

-- Centers the screen every time I move to a match
-- And opens all the folds for the line the match is on
vim.keymap.set("n", "n", "nzzzv", { desc = "Continues searching in the same direction of the previous search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Continues searching in the opposite direction of the previous search" })
vim.keymap.set("n", "*", "*zzzv", { desc = "Search the word under the cursor in the forward direction" })
vim.keymap.set("n", "#", "#zzzv", { desc = "Search the word under the cursor in the backward direction" })

-- Use the Leader key to yank to system clipboard
vim.keymap.set({ "n", "v" }, "<Leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<Leader>Y", [["+y$]], { desc = "Yank till the end of the line to system clipboard" })

-- Deleting something instead of cutting
vim.keymap.set({ "n", "v" }, "<Leader>d", [["_d]], { desc = "Delete" })

-- Use the leader key to paste from system clipboard
vim.keymap.set({ "n", "v" }, "<Leader>pp", [["+p]], { desc = "Paste from system clipboard after the cursor" })
vim.keymap.set({ "n", "v" }, "<Leader>P", [["+P]], { desc = "Paste from system clipboard before the cursor" })

-- Replaces the word that the cursor is currently on throughout the entire file
vim.keymap.set("n", "<Leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace the word hovered by the cursor throughout the entire file" })

-- Escape the terminal prompt and go into normal mode.
-- This key binding is a lifesaver.
-- https://reddit.com/r/neovim/comments/yg2d9v/how_do_i_exit_the_terminal_mode/iu6i0kl/
vim.keymap.set("t", "<C-space>", [[<C-\><C-n>]], { desc = "Escape the terminal prompt and enter normal mode" })
