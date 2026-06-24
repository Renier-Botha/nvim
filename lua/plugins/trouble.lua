return {
    "https://github.com/folke/trouble.nvim",
    cmd = "Trouble",
    opts = {}, -- lazy.nvim passes this table to require("trouble").setup()
    keys = {
        { "<leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
        { "<leader>xX", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
        { "<leader>xs", "<Cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)" },
        { "<leader>xl", "<Cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP Definitions / references (Trouble)" },
        { "<leader>xL", "<Cmd>Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },
        { "<leader>xQ", "<Cmd>Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)" },
    },
}
