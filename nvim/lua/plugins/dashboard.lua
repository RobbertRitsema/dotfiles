return {
  "nvimdev/dashboard-nvim",
  opts = function()
    local logo = [[
        ██████╗  █████╗ ███╗   ███╗███╗   ███╗    ██╗   ██╗██╗███╗   ███╗
        ██╔══██╗██╔══██╗████╗ ████║████╗ ████║    ██║   ██║██║████╗ ████║
        ██████╔╝███████║██╔████╔██║██╔████╔██║    ██║   ██║██║██╔████╔██║
        ██╔══██╗██╔══██║██║╚██╔╝██║██║╚██╔╝██║    ╚██╗ ██╔╝██║██║╚██╔╝██║
        ██████╔╝██║  ██║██║ ╚═╝ ██║██║ ╚═╝ ██║     ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝      ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "hyper",
      config = {
        header = vim.split(logo, "\n"),
        shortcut = {
          {
            desc = "󰊳 Update",
            group = "@property",
            action = "Lazy update",
            key = "u",
          },
          {
            icon = " ",
            icon_hl = "@variable",
            desc = "Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            desc = " NVIM dotfiles",
            group = "Number",
            action = [[lua LazyVim.pick.telescope.config_files()()]],
            key = "d",
          },
          {
            icon = " ",
            icon_hl = "@variable",
            desc = "Previous session",
            group = "Label",
            action = 'lua require("persistence").load()',
            key = "f",
          },
        },
      },
    }

    return opts
  end,
}
