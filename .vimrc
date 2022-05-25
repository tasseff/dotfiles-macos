" Make Vim more useful
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'lervag/vimtex'
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jamessan/vim-gnupg'
Plugin 'julialang/julia-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
call vundle#end()

" Use the Solarized Dark theme
set background=dark
colorscheme solarized
let g:solarized_visibility="high"
let g:solarized_contrast="high"
let g:solarized_termtrans=1

" Use the OS clipboard by default.
set clipboard=unnamed

filetype plugin indent on
syntax enable

" Enable line numbers
set number

" Make tabs as wide as four spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Show the cursor position
set ruler

" Highlight searches
set hlsearch

if has("autocmd")
	" Enable file type detection
	filetype on

    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4

let g:GPGPreferArmor=1
let g:GPGPreferSign=1

augroup GnuPGExtra
    autocmd BufReadCmd,FileReadCmd *.\(gpg\|pgp\) call SetGPGOptions()
    autocmd CursorHold *.\(gpg\|pgp\) quit
augroup END

function SetGPGOptions()
    set updatetime=60000
    set foldmethod=marker
    set foldclose=all
    set foldopen=insert
endfunction
