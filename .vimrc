call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

 " Any valid git URL is allowed
 Plug 'https://github.com/junegunn/vim-github-dashboard.git'
 Plug 'https://github.com/flazz/vim-colorschemes.git'
 Plug 'https://github.com/Valloric/YouCompleteMe.git'

 " Group dependencies, vim-snippets depends on ultisnips
 Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

 " On-demand loading
 " Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
 " Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

 " Using a non-master branch
 "Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

 " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
 Plug 'fatih/vim-go', { 'tag': '*' }

 " Plugin options
 Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

 " Plugin outside ~/.vim/plugged with post-update hook
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

 " Unmanaged plugin (manually installed and updated)
 Plug '~/my-prototype-plugin'
 Plug 'bling/vim-airline'
 " Add plugins to &runtimepath
 Plug 'kien/ctrlp.vim'
 Plug 'majutsushi/tagbar'
 Plug 'mileszs/ack.vim'
 Plug 'vim-airline/vim-airline-themes'
 call plug#end()

set tags=./tags;/
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nmap <F8> :TagbarToggle<CR>
syntax on

function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()

nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>

set background=dark
color molokai
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=white
set hlsearch
set backspace=2
set laststatus=2
set number

