-- in plugins/osc52.lua
return {
  "ojroques/nvim-osc52",
  config = function()
    require("osc52").setup()
    -- Yank to system clipboard with yy, y, etc.
    vim.keymap.set("n", "y", require("osc52").copy_operator, { expr = true })
    vim.keymap.set("n", "yy", "<leader>yy", { noremap = true, silent = true })
  end,
}
