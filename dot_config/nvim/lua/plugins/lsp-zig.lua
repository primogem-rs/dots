return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                zls = {
                    cmd = { "zls" },
                    mason = false,
                },
            },
        },
    },
    {
        "nvzone/typr",
        dependencies = "nvzone/volt",
        opts = {},
        cmd = { "Typr", "TyprStats" },
    },
}
