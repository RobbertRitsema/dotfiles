local M = {
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
}

M.build = function()
  vim.fn["mkdp#util#install"]()
end

return M
