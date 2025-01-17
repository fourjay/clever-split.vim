if exists('g:loaded_clever_split')
    finish
endif

command! -nargs=* -complete=file_in_path HCleversplit call clever_split#split(<q-args>)
command! -nargs=* -complete=file_in_path VCleversplit call clever_split#vsplit(<q-args>)
command! -nargs=* -complete=file_in_path Cleversplit  call clever_split#clever_split(<q-args>)
command! -nargs=+ -complete=help         Cleverhelp   call clever_split#help(<q-args>)

if exists('g:clever_split#overwrite_default_mappings')
    nnoremap <silent><C-w>s :<C-u>CleverHSplit<CR>
    nnoremap <silent><C-w>v :<C-u>CleverVSplit<CR>
    nnoremap <silent><C-w><Leader> :<C-u>CleverSplit<CR>
    augroup clever_split
        autocmd!
        autocmd FileType vim nnoremap <silent><buffer>K :<C-u>call clever_split#help(expand('<cword>'))<CR>
    augroup END
endif

let g:loaded_clever_split = 1
