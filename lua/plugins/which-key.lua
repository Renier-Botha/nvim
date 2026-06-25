return {
    "https://github.com/folke/which-key.nvim",
    event = "VeryLazy",
    opts = { -- lazy.nvim passes this table to require("which-key").setup()
        spec = {
            { "<leader>t", group = "Terminal" },
            { "<leader>x", group = "Trouble" },
        },
    },
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = false }) end,
            desc = "Buffer local keymaps",
        },
    },
}
