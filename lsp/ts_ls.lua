---@brief
---
--- https://github.com/typescript-language-server/typescript-language-server
---
--- TypeScript / JavaScript language server (`ts_ls`, formerly `tsserver`).
---
--- Installed via mason as `typescript-language-server`. The default `cmd`
--- assumes the binary is on `$PATH` (mason puts it there).
---
--- See the docs for available settings:
--- https://github.com/typescript-language-server/typescript-language-server#workspace_didchangeconfiguration

---@type vim.lsp.Config
return {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
  settings = {
    -- Inlay hints are off by default; enable the ones you find useful.
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'literals',
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'literals',
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
      },
    },
  },
}
