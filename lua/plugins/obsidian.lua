-- https://github.com/obsidian-nvim/obsidian.nvim (community-maintained fork of epwalsh/obsidian.nvim)

-- Vault location is machine-specific, so it's kept out of the committed config:
-- set $OBSIDIAN_VAULT (see lua/local.example.lua). If it's unset or the
-- directory doesn't exist, this plugin disables itself entirely.
local vault = vim.env.OBSIDIAN_VAULT or ""

return {
	"https://github.com/obsidian-nvim/obsidian.nvim",
	version = "*", -- use the latest tagged release rather than bleeding-edge main
	-- Don't even register the plugin unless a real vault is configured,
	-- so cloning these dotfiles elsewhere just silently skips Obsidian.
	cond = vault ~= "" and vim.fn.isdirectory(vault) == 1,
	dependencies = {
		"https://github.com/nvim-lua/plenary.nvim", -- required utility library
	},
	-- Only load for markdown files living under your vault, so the plugin
	-- (and its commands) stay dormant for unrelated markdown.
	event = {
		"BufReadPre " .. vault .. "/**.md",
		"BufNewFile " .. vault .. "/**.md",
	},
	cmd = "Obsidian", -- also load when you run any :Obsidian command
	---@module 'obsidian'
	---@type obsidian.config.ClientOpts
	opts = {
		workspaces = {
			{
				name = "personal",
				path = vault,
			},
		},
		-- Use the new ":Obsidian <subcommand>" commands only; turn off the
		-- legacy ":ObsidianX" commands (default-on) to silence the deprecation warning.
		legacy_commands = false,
		-- render-markdown.nvim handles in-buffer rendering, so turn off
		-- obsidian's own UI to avoid the two fighting over concealment.
		ui = { enable = false },
		picker = {
			-- junegunn/fzf.vim is NOT supported; obsidian only integrates with
			-- telescope, ibhagwan/fzf-lua, mini.pick, or snacks.picker. Reuse
			-- snacks (already installed) so no extra picker plugin is needed.
			name = "snacks.picker",
		},
	},
	keys = {
		{ "<leader>oo", "<Cmd>Obsidian quick_switch<CR>", desc = "Obsidian: quick switch note" },
		{ "<leader>os", "<Cmd>Obsidian search<CR>", desc = "Obsidian: search notes" },
		{ "<leader>on", "<Cmd>Obsidian new<CR>", desc = "Obsidian: new note" },
		{ "<leader>ot", "<Cmd>Obsidian today<CR>", desc = "Obsidian: today's daily note" },
		{ "<leader>ob", "<Cmd>Obsidian backlinks<CR>", desc = "Obsidian: backlinks" },
		{ "<leader>of", "<Cmd>Obsidian follow_link<CR>", desc = "Obsidian: follow link" },
	},
}
