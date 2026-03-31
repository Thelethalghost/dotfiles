return {
    "tiagovla/tokyodark.nvim",
    opts = {
        transparent_background=true,
        -- custom options here
    },
    config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
        vim.cmd [[colorscheme tokyodark]]
    end,
}
