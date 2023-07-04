local M = {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  build = function()
    pcall(function()
      require("mason-registry").refresh()
    end)
  end,
  event = "User FileOpened",
  lazy = true,
}

function M.config()
  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }
end

return M
