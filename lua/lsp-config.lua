-- View error in a floating window

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show diagnostic [e]rror" });

-- Jump to the next/previous error
vim.keymap.set('n', '[d', vim.diagnostic.jump, { desc = "Go to previous diagnostic" });

