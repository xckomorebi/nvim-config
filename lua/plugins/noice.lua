return {
	"folke/noice.nvim",

	event = "VeryLazy",

	dependencies = {
		"MunifTanjim/nui.nvim",
		{ "rcarriga/nvim-notify", opts = { top_down = false } },
		"ibhagwan/fzf-lua",
	},

	keys = {
		{ "<leader>nd", "<cmd>NoiceDismiss<cr>", desc = "Noice Dismiss Messages" },
	},

	opts = {
		presets = {
			command_palette = true,
		},
		routes = {
			-- {
			-- 	filter = { event = "msg_show", },
			-- 	view = "notify",
			-- 	opts = {
			-- 		level = "info",
			-- 		skip = false,
			-- 		replace = true,
			-- 	}
			-- },
		}
	}
}
