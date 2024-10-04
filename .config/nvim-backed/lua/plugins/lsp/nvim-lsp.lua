return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "microsoft/python-type-stubs", -- for pyright
  },
  priority = 70,

  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")

    mason.setup()

    lspconfig.ts_ls.setup({})

    lspconfig.hls.setup({})

    lspconfig.html.setup({})

    lspconfig.cssls.setup({})

    lspconfig.yamlls.setup({})

    lspconfig.jsonls.setup({})

    lspconfig.zls.setup({})

    lspconfig.tailwindcss.setup({})

    lspconfig.elixirls.setup({})

    lspconfig.marksman.setup({})

    lspconfig.lua_ls.setup({})

    lspconfig.dockerls.setup({})

    lspconfig.clangd.setup({
      cmd = { "clangd", "--background-index" },
    })

    lspconfig.pyright.setup({
      before_init = function(_, config)
        config.settings.python.analysis.stubPath =
            vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "python-type-stubs")
      end,
    })
    -- lspconfig.jedi_language_server.setup({})
    lspconfig.svelte.setup({})

    lspconfig.rust_analyzer.setup({
      -- Server-specific settings. See `:help lspconfig-setup`
      settings = {
        ["rust-analyzer"] = {},
      },
    })

    lspconfig.dockerls.setup({})

    lspconfig.docker_compose_language_service.setup({})
  end,
}
