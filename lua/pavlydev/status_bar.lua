return {
    "arsham/arshamiser.nvim",
    dependencies = {
        "arsham/arshlib.nvim",
        "famiu/feline.nvim",
        "kyazdani42/nvim-web-devicons",
        "lewis6991/gitsigns.nvim",
    },
    config = function()
        require("arshamiser.feliniser")
        _G.custom_foldtext = require("arshamiser.folding").foldtext
        vim.opt.foldtext = "v:lua.custom_foldtext()"
        vim.api.nvim_set_option("tabline", [[%{%v:lua.require("arshamiser.tabline").draw()%}]])
    end,
}
