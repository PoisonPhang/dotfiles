local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Navigation
keymap("n", "n", "j", opts) -- down
keymap("n", "e", "k", opts) -- up
keymap("n", "i", "l", opts) -- right
keymap("n", "k", "n", opts) -- next search
keymap("n", "K", "N", opts) -- last search
keymap("n", "j", "e", opts) -- end of word

keymap("v", "n", "j", opts) -- down
keymap("v", "e", "k", opts) -- up
keymap("v", "i", "l", opts) -- right
keymap("v", "j", "e", opts) -- end of word

-- Edit
keymap("n", "l", "i", opts)
