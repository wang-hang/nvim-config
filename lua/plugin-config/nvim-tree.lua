local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("没有找到nvim-tree")
  return
end

local list_keys = require("keybinding").nvimTreeList
nvim_tree.setup({ -- 显示 git状态图标
   git = {
      enable = true,
   },

   -- project plugin 需要这样配置
   update_cwd = true,
   update_focused_file = {
      enable = true,
      update_cwd = true,
   },
   -- 文件隐藏
   filters = {
      dotfiles = false,
      custom = {},
   },

   view = {
      -- 宽度
      width = 40,
      side = 'left',
      hide_root_folder = false,
      mappings = {
        custom_only = false,
        list = list_keys,
      },

      number = false,
      relativenumber = false,
      signcolumn = 'yes',
   },
   actions = {
      open_file = {
        -- 首次打开 适配大小
        resize_window = true,
        -- 打开文件时关闭
        quit_on_open = false,
      }
   },
   system_open = {
      cmd = 'open'
   },
})
--自动关闭

vim.cmd(
  [[
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  ]]
)

