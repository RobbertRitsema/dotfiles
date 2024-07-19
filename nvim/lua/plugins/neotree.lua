return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<C-e>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    { "<leader>e", false },
    { "<leader>E", false },
  },
  opts = {
    filesystem = {
      bind_to_cwd = true,
    },
    window = {
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        ["/"] = false,
      },
    },
  },
}
