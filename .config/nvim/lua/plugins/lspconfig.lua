return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        marksman = function()
          vim.diagnostic.enable(false)
          -- vim.diagnostic.disable(0)  -- Disable diagnostics for current buffer
          -- Or globally:
          -- vim.diagnostic.disable(nil)
        end,
      },
    },
  },
}
