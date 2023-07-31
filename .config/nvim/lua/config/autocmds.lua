-- Auto commands to run

-- Highlight yanked region
vim.cmd([[
    augroup highlight_yank
        autocmd!
            au TextYankPost * silent! lua vim.highlight.on_yank { higroup = "IncSearch", timeout = 150 }
    augroup END
]])

--[[ -- Function to check Neovim is inside a Git repositary
local function check_git_repo()
  local cmd = "git rev-parse --is-inside-work-tree"
  if vim.fn.system(cmd) == "true\n" then
    vim.api.nvim_exec_autocmds("User", { pattern = "InGitRepo" })
    return true  -- removes autocmd after lazy loading git related plugins
  end
end

-- Creates an auto command to check whether we are in a Git repositary when Neovim is entered or when the directory is changed
vim.api.nvim_create_autocmd(
  { "VimEnter", "DirChanged" },
  { callback = function() vim.schedule(check_git_repo) end }
) ]]

