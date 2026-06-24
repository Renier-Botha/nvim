return {
    "https://github.com/folke/todo-comments.nvim",
    dependencies = {
        "https://github.com/nvim-lua/plenary.nvim",
    },
    event = { "BufReadPost", "BufNewFile" }, -- Highlight comments once a file is open
    opts = {}, -- lazy.nvim passes this table to require("todo-comments").setup()
    keys = {
        { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
        { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
        { "<leader>st", "<Cmd>TodoQuickFix<CR>", desc = "Search Todo (quickfix)" },
    },
}
