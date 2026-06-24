return {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    branch = "main", -- The rewritten branch; the old `master` module API (configs/highlight/indent) is gone
    build = ":TSUpdate", -- Recompile parsers after install/update
    lazy = false, -- Load at startup so the FileType autocmd below catches the first buffer too
    config = function()
        -- Install (and keep updated) the parsers you care about.
        -- This runs asynchronously, so a brand-new parser may only start
        -- highlighting the next time you open that filetype.
        require("nvim-treesitter").install({
            "lua",
            "rust",
            "vimdoc",
            "markdown",
            "markdown_inline",
            "bash",
            "json",
            "yaml",
            "typescript",
            "tsx",
            "javascript",
            "jsdoc",
            "html",
            "css",
            "http", -- pairs with the kulala plugin
        })

        -- On the main branch, highlighting and indentation are no longer
        -- "modules" you enable in setup() — you start them per buffer.
        -- Do that whenever a buffer's filetype has a parser available.
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(event)
                local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
                if not (lang and vim.treesitter.language.add(lang)) then
                    return -- No parser installed for this filetype yet
                end
                vim.treesitter.start() -- Treesitter syntax highlighting
                vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Treesitter-aware indentation
            end,
        })
    end,
}
