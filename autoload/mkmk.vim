vim9script
const sign_group = 'mkmk#marker'
const sign_name_prefix = 'mkmk#marker_'

var initialized = 0
def Init_markers()
  if initialized != 0
    return
  endif
  const markers = split('abcdefghijklmnopqrstuvwxyz' .. 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' .. '0123456789' .. '[]<>''`"^.(){}', '\zs')
  for c in markers
    sign_define(sign_name_prefix .. c, { "text": " " .. c })
  endfor
  initialized = 1
enddef

def Remove_all_markers()
  sign_unplace(sign_group)
enddef

def Put_marker(m: dict<any>)
  const marker_char = m['mark'][1]
  sign_place(0, sign_group, sign_name_prefix .. marker_char, bufnr(), { "lnum": m['pos'][1] })
enddef

export def Update_marks()
  Init_markers()
  const marks = getmarklist(bufname())
  const signs = sign_getplaced(bufname(), { "group": sign_group })
  Remove_all_markers()
  for m in marks
    Put_marker(m)
  endfor
enddef


