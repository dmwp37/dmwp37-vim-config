if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.mvcu* setfiletype vcu
  au! BufRead,BufNewFile *.vcu* setfiletype vcu
  au! BufRead,BufNewFile *.mvpu* setfiletype vpu
  au! BufRead,BufNewFile *.vpu* setfiletype vpu
  au! BufRead,BufNewFile *.si    setfiletype xml
augroup end
