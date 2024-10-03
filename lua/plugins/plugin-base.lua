return {
  {
    "nathom/filetype.nvim",
    lazy = true,
    event = "User FileOpened",
    config = function()
        require("filetype").setup({
            overrides = {
                extensions = {
                    -- C++ 头文件扩展名
                    hpp = "cpp",
                    hh = "cpp",
                    hxx = "cpp",
                    -- C++ 源文件扩展名
                    cpp = "cpp",
                    cxx = "cpp",
                    cc = "cpp",
                    -- C 源文件扩展名
                    c = "c",
                    -- 动态处理 .h 文件（C 或 C++）
                    h = function()
                        -- 定义所有可能的 C++ 和 C 扩展名
                        local cpp_extensions = { ".cpp", ".cxx", ".cc" }
                        local c_extensions = { ".c" }

                        -- 获取当前文件的基本名称（不带扩展名）
                        local base_name = vim.fn.expand('%:r')

                        -- 检查同目录下是否有对应的 C++ 文件
                        for _, ext in ipairs(cpp_extensions) do
                            if vim.fn.glob(base_name .. ext) ~= "" then
                                return "cpp" -- 如果找到任何 C++ 源文件，则认为是 C++
                            end
                        end

                        -- 检查同目录下是否有对应的 C 文件
                        for _, ext in ipairs(c_extensions) do
                            if vim.fn.glob(base_name .. ext) ~= "" then
                                return "c" -- 如果找到 C 源文件，则认为是 C
                            end
                        end

                        -- 如果没有找到匹配的文件，默认将 .h 文件视为 C++
                        return "cpp"
                    end,
                },
            }
        })
    end
  },
  -- add bracket
  {
    "HiPhish/nvim-ts-rainbow2",
    -- Bracket pair rainbow colorize
    lazy = true,
    event = { "User FileOpened" },
  },
  {
    "romgrk/nvim-treesitter-context",
    lazy = true,
    event = { "User FileOpened" },
    config = function()
      require("treesitter-context").setup({
          enable = true,
          throttle = true,
          max_lines = 0, -- 没有行数限制
          patterns = {
              default = {
                  "class",
                  "function",
                  "method",
              },
              rust = {
                  "impl_item",
                  "struct",
                  "enum",
              },
              python = {
                  "def",
                  "class",
              },
              cpp = {
                  "namespace",
                  "class",
                  "function",
              },
              java = {
                  "class",
                  "function",
                  "method",
   "if_statement",
              },
              -- 添加 Lean4 的支持
              lean4 = {
                  "def",
                  "theorem",
                  "inductive",
              },
              -- 添加 Go 语言的支持
              go = {
                  "func",
                  "type",
                  "struct",
              },
              -- 添加 Haskell 的支持
              haskell = {
                  "function",
                  "class",
                  "data",
                  "newtype",
              },
          },
      })
    end,
  },
  {
    "windwp/nvim-spectre",    -- 插件的 GitHub 仓库路径
    lazy = true,              -- 懒加载插件
    cmd = { "Spectre" },       -- 仅在运行 :Spectre 命令时加载插件
    config = function()        -- 插件的配置函数
      require("spectre").setup()
    end,
  },
  {
    "andymass/vim-matchup",
    -- Highlight, jump between pairs like if..else
    lazy = true,
    event = { "User FileOpened" },
    config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
        lvim.builtin.treesitter.matchup.enable = true
    end,
  },
  -- 配置弹出窗口的功能
  {
    "rcarriga/nvim-notify",
    lazy = true,
    event = "VeryLazy",
    config = function()
        local notify = require("notify")
        notify.setup({
            -- "fade", "slide", "fade_in_slide_out", "static"
            stages = "static",
            on_open = nil,
            on_close = nil,
            timeout = 3000,
            fps = 1,
            render = "default",
            background_colour = "Normal",
            max_width = math.floor(vim.api.nvim_win_get_width(0) / 2),
            max_height = math.floor(vim.api.nvim_win_get_height(0) / 4),
            -- minimum_width = 50,
            -- ERROR > WARN > INFO > DEBUG > TRACE
            level = "TRACE",
        })

        vim.notify = notify
    end,
  },
  -- 增强Neovim UI体验
  {
    "folke/noice.nvim",
    enabled = ENABLE_NOICE,
    lazy = true,
    event = { "BufRead", "BufNewFile" },
    dependencies = { "rcarriga/nvim-notify", "MunifTanjim/nui.nvim" },
    config = function()
        require("noice").setup({
            lsp = {
                progress = {
                    enabled = false,
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = true,
            },
            messages = {
                enabled = true,
                view = "notify",
                view_error = "notify",
                view_warn = "notify",
                view_history = "messages",
                view_search = "virtualtext",
            },
            health = {
                checker = false,
            },
        })
    end,
  },

  { "lukas-reineke/cmp-under-comparator", lazy = true },
  {
    "ray-x/cmp-treesitter",
    lazy = true,
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
       require('lualine').setup()
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
	config = function()
    	require("neo-tree").setup({
		  popup_border_style = "rounded",
		})
		end,  
  },
  { 
   "tiagovla/scope.nvim",
  },
  {
    "akinsho/bufferline.nvim",
    tag = "v4.*",
    config = function()
		vim.g.termguicolors = true
		require("bufferline").setup()
    end,
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
		require('dashboard').setup ({
         -- config
       })
      end,
     dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
    "azabiong/vim-highlighter",
  },
  {
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({
				input = {
					enabled = true,
				},
			})
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.WARN,
				filetype = {
					lua = { require("formatter.filetypes.lua").stylua },
					java = { require("formatter.filetypes.java").clangformat },
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			})
		end,
	},
	{
		"stevearc/aerial.nvim",
		opts = {},
		config = function()
			require("aerial").setup({
				layout = {
					max_width = { 40, 0.2 },
					min_width = 20,
				},
				filter_kind = {
					"Class",
					"Constructor",
					"Enum",
					"Function",
					"Interface",
					"Module",
					"Method",
					"Struct",
				},
				open_automatic = true,
			})
		end,
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = false,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
	{
		"felipec/vim-sanegx",
		event = "BufRead",
	},
}
