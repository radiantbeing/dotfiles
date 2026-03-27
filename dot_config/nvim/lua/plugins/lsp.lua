return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "tailwindcss",
                "eslint",
                "emmet_language_server",
                "jdtls",
            },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            { "neovim/nvim-lspconfig" },
        },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
