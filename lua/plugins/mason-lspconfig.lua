return {
    "https://github.com/mason-org/mason-lspconfig.nvim",
    dependencies = {
        "https://github.com/mason-org/mason.nvim",
    },
    opts = {
        -- Servers listed here are auto-installed and, by default in v2,
        -- automatically enabled via vim.lsp.enable() — so you no longer
        -- need to call vim.lsp.enable() manually in init.lua for these.
        ensure_installed = {
            "lua_ls",
            "rust_analyzer",
            "ts_ls", -- TypeScript / JavaScript (typescript-language-server)
        },
    },
}
