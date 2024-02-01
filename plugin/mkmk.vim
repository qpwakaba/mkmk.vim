vim9script
import "../autoload/mkmk.vim"

const autocmd_events = [
  "BufEnter",
  "BufWinEnter",
  #"CursorMoved",
  "InsertLeave",
  "TextChanged",
  "CmdlineLeave",
]

def Mkmk_command_mk()
  autocmd_add([{
    "bufnr": bufnr(),
    "group": autocmd_group,
    "event": autocmd_events,
    "cmd": "Mkmk"
  }])

  mkmk.Update_marks()
enddef

command Mkmk call Mkmk_command_mk()

const autocmd_group = "mkmk#autocmd"
try
  autocmd_delete([{ "group": autocmd_group }])
catch /^Vim\%((\a\+)\)\=:E367:/
endtry
