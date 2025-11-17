local noice = require("noice")

noice.setup ({
	views = {
        notify = {
			replace = true, -- 新通知会替换旧通知
			merge = true,   -- 相同的通知合并
        },
        cmdline_popup = {
            position = {
                row = "50%",
                col = "50%",
			},
			size = {
				min_width = 60,
				width = "auto",
				height = "auto",
			},
	    },
		popupmenu = {
			relative = "editor",
			position = {
				row = "50%",
				col = "50%",
			},
			size = {
				min_width = 60,
				width = "auto",
				height = "auto",
			},
		},
	},
    cmdline = {
        enabled = true, -- enables the Noice cmdline UI
        view = "cmdline_popup", -- view to use for the cmdline
        format = {
            search_down = { icon = " ", lang = "search" },
            search_up = { icon = " ", lang = "search" },
            filter = { icon = " ", lang = "filter" },
            lua = { icon = " ", lang = "lua" },
            help = { icon = " ", lang = "help" },
        },
      },
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    -- 开启通知 UI
    notify = {
        enabled = true,
        view = "notify", -- 你可以改成 mini 或其他视图
    },
})

