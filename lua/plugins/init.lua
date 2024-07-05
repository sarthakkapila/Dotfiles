return {
  -- Formatting on save with conform.nvim
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- LSP configuration with nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- Completion setup
  {
    "nvim-lua/completion-nvim",
    config = function()
      require("configs.lspconfig").pyls.setup {
        on_attach = require("completion").on_attach,
      }
    end,
  },

  -- Mason for managing LSP, DAP, linters, and formatters
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "pyright",
        "ruff",
        "black",
        "isort",
      },
    },
  },

  -- Poetry support for Neovim
  {
    "karloskar/poetry-nvim",
    config = function()
      require("poetry-nvim").setup()
    end,
  },

  -- LSP signature help
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },

  -- Better escape plugin for fast exiting insert mode
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Terminal management with nvterm
  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup()
    end,
  },

  -- Wakatime Plugin
  { "wakatime/vim-wakatime", lazy = false },

  -- Tokyo Night theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },

  -- Transparent background
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      vim.cmd[[colorscheme tokyonight]]
    end,
  }

  -- Treesitter for improved syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
}
