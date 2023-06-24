local M = {
  "windwp/nvim-autopairs",
  event = "VeryLazy",
}

M.config = function()
  require("nvim-autopairs").setup()
end


return M

