vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })
vim.keymap.set("n", "<leader>fr", ":s//g<left><left>", { silent = false })
vim.keymap.set("n", "<leader>mas", ":Mason")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- more neaded follow https://www.youtube.com/watch?v=w7i4amO_zaE&t=1158s
