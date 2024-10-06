return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	opts = {
		options = {},
		highlights = {
			buffer_selected = { italic = false, bold = false },
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
		vim.api.nvim_create_autocmd("BufAdd", {
			callback = function()
				vim.schedule(function()
					pcall(nvim_bufferline)
				end)
			end,
		})
	end,
}
