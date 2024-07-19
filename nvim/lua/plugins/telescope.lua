return {
  "nvim-telescope/telescope.nvim",

  keys = function()
    return {
      {
        "<C-p>",
        LazyVim.pick("files"),
        desc = "Find files",
      },
      {
        "<C-f>",
        LazyVim.pick("live_grep"),
        desc = "Find stuff in files",
      },
    }
  end,
}
