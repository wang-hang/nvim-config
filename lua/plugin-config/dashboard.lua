local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

local home = os.getenv('HOME')


db.custom_center = {
  {
    icon = "  ",
    desc = "Projects                            ",
    action = "Telescope projects",
  },
  {
    icon = "  ",
    desc = "Recently files                      ",
    action = "Telescope oldfiles",
  },
   {
     icon = "  ",
     desc = "Edit Nvim                         ",
     action = "edit ~/.config/nvim/init.vim",
   },
  {
    icon = "  ",
    desc = "Find  File                           ",
    action = 'Telescope find_files find_command=rg,--hidden,--files',
  }
}
 -- macos
  db.preview_command = 'cat | lolcat'

  db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
  db.preview_file_height = 6
  db.preview_file_width = 87
