vim.cmd [[
try
  set t_Co=256
  set t_ut=
  " colorscheme onedarkpro
  " colorscheme sonokai
  " colorscheme dark_plus
  " colorscheme darkplus
  colorscheme codedark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
