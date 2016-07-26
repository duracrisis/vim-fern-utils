" Name:    fern-utils.vim
" Last Change: Wed Jun  1 10:06:34 EDT 2016
" Maintainer:  Fernand Boudreau <fernand.boudreau@gmail.com>
" Original Author: Fernand Boudreau <fernand.boudreau@gmail.com> 
" Summary: Vim plugin with various utils form me!
" License: This program is free software; you can redistribute it and/or
"          modify it under the terms of the GNU General Public License
"          as published by the Free Software Foundation; either version
"          2 of the License, or (at your option) any later version.
"          See http://www.gnu.org/copyleft/gpl-2.0.txt
"
" Section: Documentation {{{1
"
"
" Section: Maps {{{1
map <f5> qq
map <f6> q
map <f7> @q
map <C-up> 5k
map <C-down> 5j
map <leader>nt :NERDTreeToggle<CR>
map <leader>tl :Tlist<CR>
map <leader>gg :silent grep -r 

" Section: Functions {{{1

"" Search for and load cscope file, starting from the current directory, going up.
function! LoadCscope()

    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate conneciton' error
        exec "cs add " . db . " " . path
        set cscopeverbose
    endif

endfunction
au BufEnter /* call LoadCscope() "Call for each buffer that is loaded.
map <leader>lc :call LoadCscope()<CR>

" Make android source from within Vim.
function! MakeAndroid(...)
    let cwd = getcwd()
    :echo cwd
    :echo a:000
    :cd /mnt/android_hd
    "make
    exec "cd  " . cwd
endfunction
command! Mandy :call MakeAndroid() <CR>
map <leader>ma :Mandy<CR>


function! DevSetup()
  :NERDTreeToggle<CR>
  :Tlist
endfunction

function! Today()
   :exe ":normal o=" . strftime("%c") . "=" 
   :normal o
endfunction


noremap <F8> :call HexMe()<CR>

let $in_hex=0
function! HexMe()
    set binary
    set noeol
    if $in_hex>0
        :%!xxd -r
        let $in_hex=0
    else
        :%!xxd
        let $in_hex=1
    endif
endfunction



" vim600: set foldmethod=marker foldlevel=0 :
