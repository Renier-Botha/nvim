-- https://github.com/MeanderingProgrammer/render-markdown.nvim
return {
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "https://github.com/nvim-treesitter/nvim-treesitter", -- needs the markdown / markdown_inline parsers
        "https://github.com/nvim-tree/nvim-web-devicons", -- icon glyphs for headings, callouts, etc.
    },
    ft = { "markdown", "Avante" }, -- render in markdown buffers (Avante covered in case you add it later)
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {}, -- lazy.nvim passes this table to require("render-markdown").setup()
    keys = {
        { "<leader>tm", "<Cmd>RenderMarkdown toggle<CR>", desc = "Toggle markdown render" },
    },
}
