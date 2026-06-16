require("base")
require("lazy-config")
require("lsp-config")

-- Automatically start rust-analyzer when opening Rust files
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("lua_ls")
