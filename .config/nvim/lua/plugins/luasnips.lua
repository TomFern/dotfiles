return {
  {
    "L3MON4D3/LuaSnip",
    -- dependencies = {
    --   "rafamadriz/friendly-snippets",
    -- },
    config = function()
      local luasnip = require("luasnip")
      -- Load the friendly-snippets (VSCode style)
      -- require("luasnip.loaders.from_vscode").lazy_load()
      -- Load your own Lua-based snippets
      require("luasnip.loaders.from_lua").lazy_load({
        paths = { "~/.config/nvim/lua/snippets" },
      })
      -- Optional config (snippet history, update events, etc.)
      luasnip.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })
    end,
  },
}
