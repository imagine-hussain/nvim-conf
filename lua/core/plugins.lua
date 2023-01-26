local astro_plugins = {
  -- Plugin manager
  ["wbthomason/packer.nvim"] = {},

  -- Optimiser
  ["lewis6991/impatient.nvim"] = {},

  -- Lua functions
  ["nvim-lua/plenary.nvim"] = { module = "plenary" },

  -- Popup API
  ["nvim-lua/popup.nvim"] = {},

  -- Indent detection
  ["Darazaki/indent-o-matic"] = {
    event = "BufReadPost",
    config = function()
      require "configs.indent-o-matic"
    end,
  },
  --[[ ["tpope/vim-sleuth"] = {}, ]]

  -- color col
  ["xiyaowong/virtcolumn.nvim"] = {
    config = function()
      require "configs.virtcolumn"
    end,
  },

  -- Strip whitespace when editing
  ["lewis6991/spaceless.nvim"] = {
    commit = "4012c778cf8973379cc4e7e52d2260b15d390462",
    config = function ()
      require "spaceless".setup()
    end
  },

  -- Notification Enhancer
  ["imagine-hussain/nvim-notify"] = {
    event = "VimEnter",
    module = { "nvim-notify" },
    config = function()
      require "configs.notify"
    end,
  },


  --[[ ["rcarriga/nvim-notify"] = { ]]
  --[[   event = "VimEnter", ]]
  --[[   config = function() ]]
  --[[     require "configs.notify" ]]
  --[[   end, ]]
  --[[ }, ]]

  -- Neovim UI Enhancer
  ["MunifTanjim/nui.nvim"] = { module = "nui" },

  -- Cursorhold fix
  ["antoinemadec/FixCursorHold.nvim"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  },

  -- Multi-cursor
  ["mg979/vim-visual-multi"] = {

  },

  ["junegunn/vim-easy-align"] = {

  },

  -- Floating cmd line for Ex commands
  -- ["VonHeikemen/fine-cmdline.nvim"] = {
  --   requires = {
  --     {'MunifTanjim/nui.nvim'}
  --   },
  --   cmd = "FineCmdline",
  --   config = function ()
  --     -- rebind `:` to FineCmdline
  --     --[[ vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>FineCmdline<CR>', {noremap = true}) ]]
  --     --[[ <cmd>FineCmdline vimgrep <CR> ]]
  --   end
  -- },

  -- NEEDS: Nvim 0.8
  -- Noice: Nice, Noise, Notice: UI replace for messages, cmdline, popupmenu
  -- ["folke/noice.nvim"] = {
  --   event = "VimEnter",
  --   after = {
  --     "nui.nvim",
  --     "nvim-notify",
  --     "nvim-cmp",
  --   },
  --   config = function()
  --     require "configs.noice"
  --   end,
  -- },

  -- Smarter Splits
  ["mrjones2014/smart-splits.nvim"] = {
    module = "smart-splits",
    config = function()
      require "configs.smart-splits"
    end,
  },

  -- Icons
  ["kyazdani42/nvim-web-devicons"] = {
    event = "VimEnter",
    config = function()
      require "configs.icons"
    end,
  },

  -- Give each tab its own scope
  ["/tiagovla/scope.nvim"] = {
    event = "VimEnter",
    config = function()
      require("scope").setup()
    end,
  },

  -- Bufferline
  ["akinsho/bufferline.nvim"] = {
    after = "nvim-web-devicons",
    config = function()
      require "configs.bufferline"
    end,
  },

  -- Lock buffers to a window -> prevent accidentally opening files inside
  -- a file-tree or terminal window
  -- TODO: Auto-setup for neotree
  ["stevearc/stickybuf.nvim"] = {},

  -- Better buffer closing
  ["famiu/bufdelete.nvim"] = { cmd = { "Bdelete", "Bwipeout" } },

  -- Tab navigation with <leader>\d
  ["antonk52/vim-tabber"] = {},

  -- File explorer
  ["nvim-neo-tree/neo-tree.nvim"] = {
    branch = "v2.x",
    module = "neo-tree",
    cmd = "Neotree",
    requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    setup = function()
      vim.g.neo_tree_remove_legacy_commands = true
    end,
    config = function()
      require "configs.neo-tree"
    end,
  },

  -- Statusline
  ["feline-nvim/feline.nvim"] = {
    after = "nvim-web-devicons",
    config = function()
      require "configs.feline"
    end,
  },

  -- Parenthesis highlighting
  ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },

  -- Autoclose tags
  ["windwp/nvim-ts-autotag"] = { after = "nvim-treesitter" },

  -- Context based commenting
  ["JoosepAlviste/nvim-ts-context-commentstring"] = { after = "nvim-treesitter" },

  -- Syntax highlighting
  ["nvim-treesitter/nvim-treesitter"] = {
    run = ":TSUpdate",
    commit = "4cccb6f",
    event = { "BufRead", "BufNewFile" },
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    config = function()
      require "configs.treesitter"
    end,
  },

  --[[ ["nvim-treesitter/playground"] = { ]]
  --[[   after = "nvim-treesitter", ]]
  --[[   config = function () ]]
  --[[     require "configs.treesitter-playground" ]]
  --[[   end, ]]
  --[[ }, ]]

  --
  --
  -- Lsp and Completions
  --
  -- Snippet collection
  ["rafamadriz/friendly-snippets"] = { opt = true },
  -- Snippet engine - Lua base
  ["L3MON4D3/LuaSnip"] = {
    module = "luasnip",
    wants = "friendly-snippets",
    config = function()
      require "configs.luasnip"
    end,
  },

  -- Completion engine
  ["hrsh7th/nvim-cmp"] = {
    module = { "nvim-cmp", "cmp" },
    event = "InsertEnter",
    config = function()
      require "configs.cmp"
    end,
  },

  -- Refactoring
  -- 'If I use an environment that has good automated refactorings, I can trust
  -- those refactorings' - Martin Fowler
  ["ThePrimeagen/refactoring.nvim"] = {
    config = function ()
      require "configs.refactoring"
    end,
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  },

  -- Used for inlay hints
  ["nvim-lua/lsp_extensions.nvim"] = {
    config = function ()
      require "configs.lsp_extensions"
    end,
  },

  -- Completion Source for UltiSnips
  -- ["git@github.com:quangnguyen30192/cmp-nvim-ultisnips.git"] = {
  --   event = "InsertEnter",
  --   after = "nvim-cmp",
  --   config = function()
  --     require "configs.cmp-ultisnips"
  --   end,
  -- },

  -- Snippet completion source
  ["saadparwaiz1/cmp_luasnip"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source "luasnip"
    end,
  },

  -- Buffer completion source
  ["hrsh7th/cmp-buffer"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source "buffer"
    end,
  },

  -- Path completion source
  ["hrsh7th/cmp-path"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source "path"
    end,
  },

  -- LSP completion source
  ["hrsh7th/cmp-nvim-lsp"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source "nvim_lsp"
    end,
  },

  -- Built-in LSP
  ["neovim/nvim-lspconfig"] = { event = "VimEnter" },

  -- LSP manager
  ["williamboman/nvim-lsp-installer"] = {
    after = "nvim-lspconfig",
    config = function()
      require "configs.nvim-lsp-installer"
      require "configs.lsp"
    end,
  },

  -- LSP symbols
  ["stevearc/aerial.nvim"] = {
    module = "aerial",
    cmd = { "AerialToggle", "AerialOpen", "AerialInfo" },
    commit = "56282c9",
    config = function()
      require "configs.aerial"
    end,
  },

  -- Formatting and linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "configs.null-ls"
    end,
  },

  -- Java lsp
  ["mfussenegger/nvim-jdtls"] = {
    config = function()
      require "configs.nvim-jdtls"
    end,
  },

  -- Code runner (mainly for java)
  ["CRAG666/code_runner.nvim"] = {
    config = function()
      require "configs.code-runner"
    end,
  },

  ---
  --- Debugging
  ---
  -- Debugging Protocol
  ["mfussenegger/nvim-dap"] = {},

  -- Telescope Integration for Dap
  ["nvim-telescope/telescope-dap.nvim"] = {
    after = "nvim-dap",
  },

  -- UI for Debugging
  ["rcarriga/nvim-dap-ui"] = {
    after = "nvim-dap",
    --[[ config = function() ]]
    --[[   require "configs.nvim-dap-ui" ]]
    --[[ end, ]]
  },

  -- Inline Virtual Text for Debugging
  ["theHamsta/nvim-dap-virtual-text"] = {
    after = "nvim-dap",
  },

  -- Debug Server Python
  -- Dependency for `nvim-dap-python`
  ["microsoft/debugpy"] = {
    after = "nvim-dap",
  },

  -- Debugger for Python
  ["mfussenegger/nvim-dap-python"] = {
    after = { "nvim-dap", "debugpy" },
  },

  -- -- Conceal for tex
  ["KeitaNakamura/tex-conceal.vim"] = {
    config = function()
      require "configs.tex-conceal"
    end,
  },
  -- Vimtex - Dependency for tex.snippets
  ["lervag/vimtex"] = {
    module = "vimtex",
    event = "VimEnter",
    tag = "v1.6",
    config = function()
      require "configs.vimtex"
    end,
  },

  -- UltiSnips
  ["SirVer/ultisnips"] = {
    module = "ultisnips",
    event = "VimEnter",
    config = function()
      require "configs.ultisnips"
    end,
  },

  -- Fuzzy finder
  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    module = "telescope",
    config = function()
      require "configs.telescope"
    end,
  },

  -- FZF fuzzy finder
  --[[ ["junegunn/fzf"] = {}, ]]

  -- Fuzzy finder syntax supporvim.fn.has "win32" == 1 and "fzy" or "fzf"t
  [("nvim-telescope/telescope-fzf-native.nvim")] = {
    after = "telescope.nvim",
    --[[ run = vim.fn.has "win32" ~= 1 and "make" or nil, ]]
    config = function()
      require("telescope") --.load_extension("fzf")
    end,
  },

  -- Git integration
  ["lewis6991/gitsigns.nvim"] = {
    event = "BufEnter",
    config = function()
      require "configs.gitsigns"
    end,
  },
  -- Git
  ["pwntester/octo.nvim"] = {
    event = "BufEnter",
    config = function()
      require "configs.octo"
    end,
  },
  -- Git (for toggle term lazygit)
  ["jesseduffield/lazygit"] = {
    event = "BufEnter",
    config = function()
      require "configs.lazygit"
    end,
  },

  -- Start screen
  ["goolord/alpha-nvim"] = {
    cmd = "Alpha",
    module = "alpha",
    config = function()
      require "configs.alpha"
    end,
  },

  -- Color highlighting
  ["norcalli/nvim-colorizer.lua"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "configs.colorizer"
    end,
  },

  -- Autopairs
  ["windwp/nvim-autopairs"] = {
    event = "InsertEnter",
    config = function()
      require "configs.autopairs"
    end,
  },

  -- Terminal
  ["akinsho/toggleterm.nvim"] = {
    cmd = "ToggleTerm",
    module = { "toggleterm", "toggleterm.terminal" },
    config = function()
      require "configs.toggleterm"
    end,
  },

  -- Commenting
  ["numToStr/Comment.nvim"] = {
    module = { "Comment", "Comment.api" },
    keys = { "gc", "gb", "g<", "g>" },
    config = function()
      require "configs.Comment"
    end,
  },

  --[[ ["SirVer/ultisnips"] = { ]]
  --[[   event = { "BufRead", "BufNewFile", "BufWritePost" }, ]]
  --[[   config = function () ]]
  --[[     require ]]
  --[[   end, ]]
  --[[ }, ]]

  -- Indentation
  ["lukas-reineke/indent-blankline.nvim"] = {
    event = "BufRead",
    config = function()
      require "configs.indent-line"
    end,
  },

  -- Keymaps popup
  ["folke/which-key.nvim"] = {
    module = "which-key",
    config = function()
      require "configs.which-key"
    end,
  },

  -- Smooth scrolling
  -- ["declancm/cinnamon.nvim"] = {
  --   event = { "BufRead", "BufNewFile"},
  --   config = function()
  --     require "configs.cinnamon"
  --   end,
  -- },
  ["karb94/neoscroll.nvim"] = {
    event = { "BufRead", "BufNewFile"},
    config = function()
      require "configs.neoscroll"
    end,
  },

  --
  -- Colorschemes
  --
  -- No config function. `colors.lua` called by `init.lua`
  ["sainnhe/gruvbox-material"] = {},
  ["sainnhe/sonokai"] = {},
  ["projekt0n/github-nvim-theme"] = {},
  ["mangeshrex/everblush.vim"] = {},
  -- Previously vim-gabriel
  ["gantoreno/vim-startrail"] = {},
  ["arzg/vim-substrata"] = {},
  ["https://gitlab.com/exorcist365/salvation-vim"] = {},
  ["sainnhe/everforest"] = {},
  ["folke/tokyonight.nvim"] = {},
  ["cocopon/iceberg.vim"] = {},
  ["arcticicestudio/nord-vim"] = {},
  ["Everblush/everblush.nvim"] = {},
  ["rebelot/kanagawa.nvim"] = {
    commit = 'fc2e308', -- last commit to work without nvim 0.8
  },
  ["https://gitlab.com/__tpb/monokai-pro.nvim"] = {},
  --[[ ["Shatur/neovim-ayu"] = {}, ]]
  ["Luxed/ayu-vim"] = {},
  -- end-colorschemes

  -- Get extra JSON schemas
  ["b0o/SchemaStore.nvim"] = { module = "schemastore" },

  -- Session manager
  ["Shatur/neovim-session-manager"] = {
    module = "session_manager",
    cmd = "SessionManager",
    event = "BufWritePost",
    config = function()
      require "configs.session_manager"
    end,
  },

  -- Wiki
  --[[ ["vimwiki/vimwiki"] = { ]]
  --[[   config = function() ]]
  --[[     require "configs.vimwiki" ]]
  --[[   end, ]]
  --[[ }, ]]

  -- Copilot
  ["github/copilot.vim"] = {
    config = function ()
      require "configs.copilot"
    end
  },

  -- Discord Integration
  ["andweeb/presence.nvim"] = {
    config = function ()
      require "configs.discord"
    end
  },

  -- Wikipedia Browser
  ["el-iot/vim-wikipedia-browser"] = {},
  -- Media Wiki - Syntax Highlighting
  ["chikamichi/mediawiki.vim"] = {},

  -- Async Promise -- Dependency for UFO folds
  ["kevinhwang91/promise-async"] = {},

  -- Folds
  ["kevinhwang91/nvim-ufo"] = {
    -- run = ':TSUpdate',
    after = "promise-async",
    event = { "BufRead", "BufNewFile" },
    config = function ()
      require "configs.nvim-ufo"
    end,
  },

  -- Leetcode Cli:
  -- Dependency: `pip3 install pynvim --user`
  -- Dependency: `pip3 install keyring browser-cookie3 --user`
  ["ianding1/leetcode.vim"] = {
    config = function()
      require "configs.leetcode"
    end,
  },

  --[[ ["epwalsh/obsidian.nvim"] = { ]]
  --[[   event = { "BufRead", "BufNewFile" }, ]]
  --[[   config = function() ]]
  --[[     require "configs.obsidian" ]]
  --[[   end, ]]
  --[[ }, ]]

  -- Preview Markdown
  -- Dependency: `pandoc` and `live-server`
  -- `brew install pandoc`
  -- `npm install -g live-server`
  ["davidgranstrom/nvim-markdown-preview"] = {},

  ["dsych/blanket.nvim"] = {
    config = function()
      require "configs.blanket"
    end,
  },

}

if astronvim.updater.snapshot then
  for plugin, options in pairs(astro_plugins) do
    local pin = astronvim.updater.snapshot[plugin:match "/([^/]*)$"]
    options.commit = pin and pin.commit or options.commit
  end
end

local user_plugin_opts = astronvim.user_plugin_opts
local packer = astronvim.initialize_packer()

packer.init {
  -- note to self: anything abt ~50 can start to thrash sometimes
  max_jobs = 24
}

packer.startup {
  function(use)
    for key, plugin in pairs(user_plugin_opts("plugins.init", astro_plugins)) do
      if type(key) == "string" and not plugin[1] then
        plugin[1] = key
      end
      use(plugin)
    end
  end,
  config = {
    compile_path = astronvim.default_compile_path,
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
    profile = {
      enable = true,
      threshold = 0.0001,
    },
    git = {
      clone_timeout = 300,
      subcommands = {
        update = "pull --rebase",
      },
    },
    auto_clean = true,
    compile_on_sync = true,
  },
}


astronvim.compiled()
