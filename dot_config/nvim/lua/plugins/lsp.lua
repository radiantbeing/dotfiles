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
}
