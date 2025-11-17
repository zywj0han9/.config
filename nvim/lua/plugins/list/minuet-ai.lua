return {
    enabled = false,
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("plugins.config.minuet")
    end,
    dependencies =  {"nvim-lua/plenary.nvim", "Saghen/blink.cmp" }, -- 依赖项
}
