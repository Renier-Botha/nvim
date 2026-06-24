return {
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
        "https://github.com/mason-org/mason.nvim",
    },
    opts = {
        -- Non-LSP tools (formatters, linters) to install via mason.
        -- These back the conform.nvim formatters configured separately.
        ensure_installed = {
            "stylua", -- Lua formatter
            "prettierd", -- Fast Prettier daemon for JS/TS/web formats
        },
    },
}
