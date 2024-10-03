return {
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300

			local wk = require("which-key")
			-- 快捷键在这里定义
			wk.add({
				-- Buffer group
				{ "<leader>b", group = "Buffer" }, -- Declare buffer group
				{ "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Go to previous buffer" },
				{ "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Go to next buffer" },
				{ "<leader>bd", "<cmd>BufferLinePickClose<cr>", desc = "Delete selected buffer" },
				{ "<leader>bt", "<cmd>BufferLinePick<cr>", desc = "Jump to specified buffer" },

				-- Code group
				{ "<leader>c", group = "Code" }, -- Declare code group
				{ "<leader>cf", "<cmd>Format<cr>", desc = "Format Code" },

				-- Go to group under Code
				{ "<leader>cg", group = "Go to" },
				{ "<leader>cgd", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to definition" },
				{ "<leader>cgf", "<cmd>Lspsaga finder<cr>", desc = "Find usage or implementations" },
				{ "<leader>cgi", "<cmd>Lspsaga finder imp<cr>", desc = "Find implementations" },

				{ "<leader>cr", "<cmd>Lspsaga rename<cr>", desc = "Rename" },

				-- dirTree group
				{ "<leader>d", group = "dirTree" },
				{ "<leader>dt", "<cmd>Neotree left<cr>", desc = "Show/Hide dir tree on left" },
				{ "<leader>dp", "<cmd>Neotree float<cr>", desc = "Pop dir tree" },
				{ "<leader>dc", "<cmd>Neotree current<cr>", desc = "Open dir tree in current" },

				-- Find group
				{ "<leader>f", group = "Find" },
				{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
				{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find string in files" },
				{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find string in buffer" },

				-- Git group
				{ "<leader>g", group = "Git" },
				{ "<leader>gb", "<cmd>Gitsigns blame<cr>", desc = "Git blame" },

				-- Lazy group
				{ "<leader>l", group = "Lazy" },
				{ "<leader>ls", "<cmd>Lazy show<cr>", desc = "Lazy show" },
				{ "<leader>li", "<cmd>Lazy install<cr>", desc = "Lazy install" },
				{ "<leader>lu", "<cmd>Lazy update<cr>", desc = "Lazy update" },

				-- Markdown group
				{ "<leader>m", group = "Markdown" },
				{ "<leader>mkp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" },
				{ "<leader>mks", "<cmd>MarkdownPreviewStop<cr>", desc = "Stop Markdown Preview" },

				-- Symbol group
				{ "<leader>s", group = "Symbol" },
				{ "<leader>st", "<cmd>AerialToggle right<cr>", desc = "Toggle symbol tree" },

				-- Java group
				{ "<leader>j", group = "Java" },

				-- Test group under Java
				{ "<leader>jt", group = "Test" },
				{ "<leader>jtd", group = "Debug" },
				{ "<leader>jtdc", "<cmd>JavaTestDebugCurrentClass<cr>", desc = "Debug current class" },
				{ "<leader>jtdm", "<cmd>JavaTestDebugCurrentMethod<cr>", desc = "Debug current method" },
				{ "<leader>jtc", "<cmd>JavaTestRunCurrentClass<cr>", desc = "Run current class" },
				{ "<leader>jtm", "<cmd>JavaTestRunCurrentMethod<cr>", desc = "Run current method" },
				{ "<leader>jtv", "<cmd>JavaTestViewLastReport<cr>", desc = "View last test report" },

				{ "<leader>jm", "<cmd>JavaRunnerRunMain<cr>", desc = "Run main method" },
				{ "<leader>jp", "<cmd>JavaProfile<cr>", desc = "Run Java profile" },

				-- Version group
				{ "<leader>v", group = "Version" },
				{ "<leader>vv", "<cmd>version<cr>", desc = "Neovim version" },
			}, { silent = true, noremap = true })
			wk.setup()
		end,
	},
}
