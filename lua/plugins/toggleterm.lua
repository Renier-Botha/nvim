-- https://github.com/akinsho/toggleterm.nvim
return {
	"https://github.com/akinsho/toggleterm.nvim",
	cmd = { "ToggleTerm", "ToggleTermToggleAll" },
	opts = { -- lazy.nvim passes this table to require("toggleterm").setup()
		open_mapping = [[<c-\>]], -- Toggle the terminal from any mode
		direction = "horizontal", -- "float" | "horizontal" | "vertical" | "tab"
		float_opts = { border = "curved" },
	},
	keys = {
		{ [[<c-\>]], "<Cmd>ToggleTerm<CR>", mode = { "n", "t" }, desc = "Toggle terminal" },
		{ "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>", desc = "Terminal (float)" },
		{ "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>", desc = "Terminal (horizontal)" },
		{ "<leader>tv", "<Cmd>ToggleTerm direction=vertical size=80<CR>", desc = "Terminal (vertical)" },
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		-- Mappings that only apply inside a toggleterm buffer, set on TermOpen.
		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "term://*toggleterm#*",
			callback = function()
				local map_opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], map_opts) -- Back to normal mode
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], map_opts) -- Same, easier to reach
				-- Window navigation straight out of terminal mode
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], map_opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], map_opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], map_opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], map_opts)
			end,
		})
	end,
}
