
local status, github_theme = pcall(require, "github-theme")
if not status then
  vim.notify("没有找到 github-theme")
  return
end

-- 注释
github_theme.setup({
  comment_style = "italic",
})
