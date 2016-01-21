" Josnelihurt Vim Configuration file

" Main and mandatory configuration
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Plugins 
" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree.git'
" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'
Plugin 'tomtom/tcomment_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-pathogen'
Plugin 'majutsushi/tagbar'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'easymotion/vim-easymotion'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'jlanzarotta/bufexplorer'
"You may use the default keymappings of
"    <Leader>be  - Opens BufExplorer
"    <Leader>bt  - Toggles BufExplorer open or closed
"    <Leader>bs  - Opens horizontally split window BufExplorer
"    <Leader>bv  - Opens vertically split window BufExplorer
Plugin 'fholgado/minibufexpl.vim'
Plugin 'sjbach/lusty'		
" <Leader>lf  - Opens filesystem explorer. 
" <Leader>lr  - Opens filesystem explorer at the directory of the current file. 
" <Leader>lb  - Opens buffer explorer. 
" <Leader>lg  - Opens buffer grep. 
Plugin 'vim-scripts/taglist.vim'
" Plugin 'msanders/snipmate.vim'
Plugin 'ervandew/supertab'
" Plugin 'wikitopian/hardmode'
" Plugin for marks
Plugin 'kshenoy/vim-signature'
" m[a-z] toggle a mark for a line using a letter
" ]` [` move to marks
Plugin 'mrtazz/DoxygenToolkit.vim'
" Dox over a function declaration will create the doxygen documentation
" skeleton
" Plugin 'vim-scripts/repeat-motion'
" let repmo_key = "down" 
" let repmo_revkey = "up"
filetype plugin indent on

" Key Mappings 
"-------------------------------------------------------------------------------
let mapleader = '\'
let g:mapleader = '\'
" no <down> <Nop>
" no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

" Remap navigation commands to center view on cursor using zz
nnoremap j jzz
nnoremap k kzz
nnoremap # #zz
nnoremap * *zz
nnoremap n nzz
nnoremap N Nzz
nnoremap h hzz
nnoremap l lzz
nnoremap N Nzz
nnoremap H Hzz
nnoremap L Lzz
" Remaps for Pluings and try to be clear

let g:ctrlp_map = '<leader>p'
nnoremap <leader>b :LustyBufferExplorer<CR>
" Open tag list
nnoremap <leader>t :Tlist<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :wa!<CR>

map <leader>ss :setlocal spell!<cr>
map <leader>nss :set nospell<cr>

" Shortcuts using <leader>
" Something about spell check
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


nmap <leader>ev :e $MYVIMRC<CR>zz
nmap <leader>sv :wa!<CR>:so $MYVIMRC<CR>zz
nnoremap <leader>tg :TlistToggle<CR>
nnoremap <leader>n :wa!<CR>:NERDTreeToggle<CR>
nnoremap <leader>m :wa!<CR>:make<CR>
nnoremap <leader>mi :wa!<CR>:make install<CR>
nnoremap <leader>mc :wa!<CR>:make clean<CR>

nnoremap <leader>do :Dox<CR>
" buffer manipulation
nnoremap <leader>bn :bnext<CR>zz
nnoremap <leader>bp :bprevious<CR>zz
map <leader>rctag :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Another remaps
" ******************************************************************************


" Plugins configurations
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'h': 1, 'python':1 }
autocmd QuickFixCmdPost * :copen
set tabstop=4
set shiftwidth=4
set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'


" Complete options (disable preview scratch window, longest removed to aways
" show menu)
set completeopt=menu,menuone

" Limit popup menu height
set pumheight=20

" Set to auto read when a file is changed from the outside
set autoread
" SuperTab completion fall-back 
" let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

" With :set hidden, opening a new file when the current buffer has unsaved
" changes causes files to be hidden instead of closed
set hidden

" UltiSnips setting
" make vim recognizing snippets dir
set runtimepath+=~/.vim/my-snippets/
" use different snippets dir
let g:UltiSnipsSnippetsDir='~/.vim/my-snippets/'
let g:UltiSnipsSnippetDirectories=["my-snippets"]
" use vertical split to edit snippets
let g:UltiSnipsEditSplit='vertical'
" trigger snippet with Ctrl-l
let g:UltiSnipsExpandTrigger='<C-l>'
" go to next snippet with Ctrl-j
let g:UltiSnipsJumpForwardTrigger='<C-j>'
" go to previous snippet with Ctrl-k
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Configurations for render and colors
set lazyredraw
set number
colorscheme desert 
syntax on 
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey90
" Auto save folding  This will write files at ~/.vim/view 
" this files may cause refreshing problems from the eviroment values THIS
" FILE
		
au BufWinLeave ?* mkview 1
au BufWinEnter ?* silent loadview 1
" This puts relative numbering to lines in fordward and backward
set relativenumber
set hlsearch
highlight ColorColumn ctermbg=7
set colorcolumn=80
set noswapfile
set nobackup
" All vim share the same clipboard buffer, not safe at all but I liked

set clipboard=unnamed
