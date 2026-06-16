-- Visit the project page for the latest installation instructions
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    -- Boilerplate for next steps.
    -- From now on, all code examples will go to this section.
    -- {
    --     "https://gitprovider.com/exampleuser/myplugin",
    -- },
    {
        "https://github.com/mason-org/mason.nvim",
        build = ":MasonUpdate", -- Update the registry of installable tools
        config = function()
            require("mason").setup()
        end,
    },
    {
        "https://github.com/junegunn/fzf.vim",
        dependencies = {
            "https://github.com/junegunn/fzf"
        },
        keys = {
            { "<Leader><Leader>", "<Cmd>Files<CR>", desc = "Find files"},
            { "<Leader>,", "<Cmd>Buffers<CR>", desc = "Find buffers" },
            { "<Leader>/", "<Cmd>Rg<CR>", desc = "Search project" }
        }
    },
    {
        "https://github.com/stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
        keys = {
            { "-", "<Cmd>Oil<CR>", desc = "Browse files from here" }
        }
    },
    {
        "https://github.com/numToStr/Comment.nvim",
        event = "VeryLazy", -- Special lazy.nvim event for things that can load later and are not important for the initial UI
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "https://github.com/tpope/vim-sleuth",
        event = { "BufReadPost", "BufNewFile" }, -- Load after your file content
    },
    {
        "https://github.com/lukas-reineke/indent-blankline.nvim",
        event = { "VeryLazy" },
        config = function()
            require("ibl").setup()
        end,
    },
    {
        "https://github.com/nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("lualine").setup()
        end,
    },
    {
        "kepano/flexoki-neovim",
        name = "flexoki",
        priority = 1000, -- Load this theme before all other plugins
        config = function()
            vim.cmd.colorscheme("flexoki-dark") -- Activate the theme here
        end,
    },
})

