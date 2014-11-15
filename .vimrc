
"Turn on pathogen https://github.com/tpope/vim-pathogen
execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme invader

" Gui options
set guioptions=aeg

" Enable mouse
set mouse=a

" Add line numbers
set number
set ruler

" Set encoding
set encoding=utf-8

" Set statusline
set laststatus=2
set statusline=%<%n:%f\ %y[%{&ff}]%r%m%=%-19(%3l,%02c%03V%)%7(%P%)\ [%LL]\ [%<%1.20{getcwd()}]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Enable cursorline
set cursorline

"configure tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

"spell checking
set spell spelllang=en_us


"Git commit messages
autocmd FileType gitcommit set colorcolumn=70
autocmd FileType gitcommit set wrap
autocmd FileType gitcommit set textwidth=70

"Markdown
autocmd BufRead *.md set ft=markdown
autocmd FileType markdown set colorcolumn=100
autocmd FileType markdown set wrap
autocmd FileType markdown set textwidth=100

"-------------------------------------------------------------
"ranger file browser integration
"see http://ornicar.github.io/2011/02/12/ranger-as-vim-file-manager.html

" Use ranger as vim file manager
function! Ranger()
    " Get a temp file name without creating it
    let tmpfile = substitute(system('mktemp -u'), '\n', '', '')
    " Launch ranger, passing it the temp file name
    silent exec '!ranger --choosefile='.tmpfile
    " If the temp file has been written by ranger
    if filereadable(tmpfile)
        " Get the selected file name from the temp file
        let filetoedit = system('cat '.tmpfile)
        exec 'edit '.filetoedit
        call delete(tmpfile)
    endif
    redraw!
endfunction

nmap <leader>r :call Ranger()<cr>

"---------------------------------------------------------------
"NERDTree

map <C-t> :NERDTreeToggle %<CR>
map <C-h> :NERDTreeFind<CR>


