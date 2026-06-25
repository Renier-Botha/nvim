pcall(require, "local") -- machine-specific env/overrides (gitignored); must run before plugin specs
require("base")
require("lazy-config")
require("lsp-config")
