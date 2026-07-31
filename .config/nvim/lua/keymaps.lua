-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Reload Neovim configuration
vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart Neovim (:restart)" })

-- Replaces selected text WITHOUT losing what you yanked
vim.keymap.set("x", "p", [["_dP"]], { desc = "Paste over selection without losing yanked text" })

-- Delete text WITHOUT saving it to any register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d"]], { desc = "Delete without yanking" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Nvimtree keymaps
vim.keymap.set("n", "\\", ":NvimTreeToggle<cr>", { desc = "Toggle Tree" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- User SHIFT+<hl> to navigate buffers
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Navigate to previous buffer" })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Navigate to the next buffer" })

-- Move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "Moves lines up in visual selection" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Keep buffer centered when moving UP/DOWN
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up in buffer with cursor centered" })

-- Keep buffer centered when searching next
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

-- Join lines without moving cursor
-- vim.keymap.set("n", "J", "mzJ`z", { desc: "Join lines without moving cursor"})

vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace workd under cursor" }
)

-- Native undotree
vim.keymap.set("n", "<leader>u", function()
	vim.cmd.packadd("nvim.undotre")
	require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })

-- vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Makes file executable" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- vim: ts=2 sts=2 sw=2 et
