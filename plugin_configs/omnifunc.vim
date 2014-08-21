" in the following languages, use <C-x> <C-o> to trigger
" autocompletion/"IntelliSense"
"
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType go set omnifunc=gocomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType bash set omnifunc=bashcomplete#Complete

