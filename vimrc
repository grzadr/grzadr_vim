scriptencoding utf-8
set encoding=utf-8

" Always install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer' } " Completing phrases
Plug 'terryma/vim-multiple-cursors' " enables editing in multiple places
Plug 'tpope/vim-eunuch' " some bash commands exposed to vim
Plug 'tpope/vim-surround' " surround words with brackets
Plug 'scrooloose/nerdtree' " tree view of directories
Plug 'Xuyuanp/nerdtree-git-plugin' " tree view of directories
Plug 'airblade/vim-gitgutter' " show extra panel with git differences from HEAD
Plug 'itchyny/lightline.vim' " powerline like plugin
Plug 'Vimjas/vim-python-pep8-indent' " indentation for python scripts
call plug#end()

if !has('gui_running')
  set t_Co=256
endif

set number        " enumerate lines
set expandtab     " don't use actual tab character (ctrl-v)
set shiftwidth=2  " indenting is 2 spaces
set autoindent    " turns on autoindent
set smartindent   " does the right thing (mostly) in programs
set laststatus=2  " always show status line - important for powerline

set listchars=eol:¬,tab:>»,trail:␣,extends:>,precedes:<,space:· " list of inivisibles
set list " sets above invisibles

filetype indent on

" toggle invisibles on/off
nmap <leader>l :set list!<CR>

" toggle line numbers on/off
nmap <leader>n :set invnumber<CR>

" Snakefile syntax
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.smk set syntax=snakemake

autocmd vimenter * NERDTree " open NERDTree when Vim startup
autocmd StdinReadPre * let s:std_in=1 " open NERDTree with empty Vim
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " close with if only NERDTree remains

set backspace=indent,eol,start
