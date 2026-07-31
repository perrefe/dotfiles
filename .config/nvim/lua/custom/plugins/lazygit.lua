local function gh(repo) return 'https://github.com/' .. repo end

-- LazyGit integration: a floating-window UI for git.
-- `load = false` works like `:packadd!`: the plugin is installed and added to
-- 'runtimepath', but its `plugin/` files are NOT sourced yet, so the `:LazyGit`
-- command does not exist until we load it on demand below.
vim.pack.add({ gh 'kdheepak/lazygit.nvim' }, { load = false })

-- Lazy-load on first keypress: `:packadd` sources the plugin's `plugin/` files
-- (creating the `:LazyGit` command), then we open it. Later presses just re-run
-- the command, which is cheap.
vim.keymap.set('n', '<leader>lg', function()
  vim.cmd.packadd 'lazygit.nvim'
  vim.cmd.LazyGit()
end, { desc = '[L]azy[G]it' })

-- vim: ts=2 sts=2 sw=2 et
