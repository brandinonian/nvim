local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- explore files (:Ex)
keymap("n", "<leader>pv", vim.cmd.Exp)

-- close buffer
keymap("n", "<leader>c", ":bdelete<CR>", opts)
