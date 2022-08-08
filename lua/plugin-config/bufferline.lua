local status, bufferline = pcall(require, "bufferline")

if not status then
    vim.notify("没有找到 buffferline")
    return
end

bufferline.setup({
  options = {
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",

    offsets = {
      {
        filetype = "NvimTree",
        text = "资源管理器",
        highlight = "Directory",
        text_align = "left",
      },
    },
    color_icons = true,

    diagnostics = "coc",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
  }
})
