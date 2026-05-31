-- lua/packs.lua

vim.pack.add({
  { src = "https://github.com/catppuccin/nvim",                    name = "catppuccin"      },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter",    name = "nvim-treesitter" },
  { src = "https://github.com/williamboman/mason.nvim",            name = "mason"           },
  { src = "https://github.com/Saghen/blink.cmp",                   name = "blink-cmp"       },
  { src = "https://github.com/Saghen/blink.lib",                   name = "blink-lib"       }, -- blink-cmp dep
  { src = "https://github.com/echasnovski/mini.nvim",               name = "mini"            },
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim",        name = "neo-tree"        },
  { src = "https://github.com/nvim-lua/plenary.nvim",              name = "plenary"         }, -- neo-tree dep
  { src = "https://github.com/MunifTanjim/nui.nvim",               name = "nui"             }, -- neo-tree dep
  { src = "https://github.com/ibhagwan/fzf-lua",                   name = "fzf-lua"         },
  { src = "https://github.com/lewis6991/gitsigns.nvim",            name = "gitsigns"        },
  { src = "https://github.com/windwp/nvim-ts-autotag",             name = "nvim-ts-autotag" },
  { src = "https://github.com/folke/todo-comments.nvim",           name = "todo-comments"   },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim", name = "render-markdown" },
  { src = "https://github.com/stevearc/conform.nvim",              name = "conform-nvim"    },
  { src = "https://github.com/mfussenegger/nvim-lint",             name = "nvim-lint"       },
  { src = "https://github.com/tpope/vim-sleuth",                   name = "sleuth"          },
})

-- Themes first so colorscheme is set before other plugins render
local themes = {
  "themes.catppuccin",
}

local plugins = {
  "plugins.treesitter",
  "plugins.lsp",
  "plugins.blink-cmp",
  "plugins.conform",
  "plugins.nvim-lint",
  "plugins.mini",
  "plugins.gitsigns",
  "plugins.neo-tree",
  "plugins.fzf-lua",
  "plugins.nvim-ts-autotag",
  "plugins.todo-comments",
  "plugins.render-markdown",
}

local function load(mods)
  for _, mod in ipairs(mods) do
    local ok, err = pcall(require, mod)
    if not ok then
      vim.notify("[plugins] Failed to load: " .. mod .. "\n" .. err, vim.log.levels.ERROR)
    end
  end
end

load(themes)
load(plugins)
