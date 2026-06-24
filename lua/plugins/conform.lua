return {
    "https://github.com/stevearc/conform.nvim",
    event = { "BufWritePre" }, -- Load just before the first save (for format-on-save)
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function() require("conform").format({ async = true, lsp_format = "fallback" }) end,
            mode = { "n", "v" },
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            rust = { "rustfmt", lsp_format = "fallback" },
            -- Prettier handles all the JS/TS family plus common web formats.
            -- prettierd is a fast daemon; fall back to prettier if it's missing.
            javascript = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            json = { "prettierd", "prettier", stop_after_first = true },
            jsonc = { "prettierd", "prettier", stop_after_first = true },
            yaml = { "prettierd", "prettier", stop_after_first = true },
            html = { "prettierd", "prettier", stop_after_first = true },
            css = { "prettierd", "prettier", stop_after_first = true },
            markdown = { "prettierd", "prettier", stop_after_first = true },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback", -- Fall back to LSP formatting when no formatter is configured
        },
    },
}
