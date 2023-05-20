
-- MACROS
vim.cmd([[
" Notice the <Esc> etc. have to be escaped with \

" CSS add !important
let @i="0f;i !important\<esc>"

let @j="\<esc>`<O{/*\<esc>lx`>o*/}\<esc>"

" Create styled component => start anywhere in a naked word, ie. MyComponet but noe <MyComponent/>
let @s="viw\"pygg}O\<cr>const \<esc>\"ppa = styled.div`\<esc>A;\<esc>hi\<cr>\<esc>i  "

]])
