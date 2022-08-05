--local colorscheme = "github_dark"
--local colorscheme = "tokyonight"
--local colorscheme = "OceanicNext"
local colorscheme = "vscode"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. "没有找到")
  return
end
