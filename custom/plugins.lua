local plugins = {
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   event = "VeryLazy",
  --   dependencies = "mfussenegger/nvim-dap",
  --   config = function()
  --     local dap = require("dap")
  --     local dapui = require("dapui")
  --     dapui.setup()
  --     dap.listeners.after.event_initialized["dapui_config"] = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated["dapui_config"] = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited["dapui_config"] = function()
  --       dapui.close()
  --     end
  --   end
  -- },
  -- {
  --   "jay-baby/mason-nvim-dap.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --     "mfussenegger/nvim.dap",
  --   },
  --   opts = {
  --     handlers = {},
  --   },
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function(_, _)
  --     require("core.utils").load_mappings("dap")
  --   end
  -- },  
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvim-java/nvim-java",
    config = false,  -- We'll set it up inside lspconfig
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            jdtls = {
              capabilities = require("cmp_nvim_lsp").default_capabilities(),
              settings = {
                java = {
                  configuration = {
                    runtimes = {
                      {
                        name = "JavaSE-17",
                        path = "/usr/lib/jvm/java-17-openjdk",
                      },
                    },
                  },
                  import = {
                    maven = {
                      enabled = true, -- Ensures Maven support
                    },
                  },
                },
              },
            },
          },
          setup = {
            jdtls = function()
              require("java").setup({
                root_markers = {
                  "pom.xml",  -- Maven project
                  "mvnw",     -- Maven Wrapper (Ensures projects using mvnw are recognized)
                  "gradlew",
                  "settings.gradle",
                },
              })
            end,
          },
        },
      },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
    },
  },
  {
    "vim-crystal/vim-crystal",
    ft = "crystal",
    config = function(_)
      vim.g.crystal_auto_format = 1
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "clangd",
        "clang-format",
        "codelldb",
      },
    },
  }
}
return plugins
