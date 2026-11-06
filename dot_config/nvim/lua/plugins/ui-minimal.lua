return {
    -- Remove bufferline tab bar
    { "akinsho/bufferline.nvim", enabled = false },

    -- Disable indent guides (indent-blankline)
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
    -- Disable indent scope if present
    { "nvim-mini/mini.indentscope", enabled = false },

    -- Disable UI animations provided by Snacks
    {
        "folke/snacks.nvim",
        opts = {
            animate = { enabled = false },
            indent = { enabled = false },
            scroll = { enabled = false },
            words = { enabled = false },
        },
    },
}
