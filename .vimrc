"                               Prerequisites   
"
"  Install the minpac package manager:
"  '''sh
"  mkdir -p ~/.vim/pack/minpac/opt
"  mkdir -p ~/.vim/tmp
"  git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
"  '''

set packpath^=~/.vim
packadd minpac

if exists('*minpac#init')
    call minpac#init({'verbose': 3})  " minpac is loaded
    call minpac#add('k-takata/minpac', {'type': 'opt'})
    " Basic plugins 
    call minpac#add('machakann/vim-sandwich')  " delete, change, add surroundings: ()[]{}<>...
    call minpac#add('scrooloose/nerdcommenter')  " commenting code
    call minpac#add('EinfachToll/DidYouMean')  " stupidity checker
    " Colorschemes  
    call minpac#add('ajmwagar/vim-deus')  " :colorscheme deus
    call minpac#add('cocopon/iceberg.vim')  " :colorscheme iceberg
    call minpac#add('dikiaap/minimalist')  " :colorscheme minimalist
    " LaTeX document support
    call minpac#add('lervag/vimtex')  " syntax, compilation, parsing etc.   
    call minpac#add('sirver/ultisnips')  " snippet manager
    call minpac#add('KeitaNakamura/tex-conceal.vim')  " latex text concealer
    call minpac#add('907th/vim-auto-save')  " automatically save changes to disk  
    " Code support 
    call minpac#add('jiangmiao/auto-pairs')  " insert or delete brackets, parens, quotes in pair 
    " call minpac#add('neoclide/coc.nvim', {'branch': 'release'})  " intellisense engine  
 endif

" minpac utility commands : call when adding/removing plugins 
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()

" Coc extentions
" :CocInstall coc-vimtex
" :CocInstall coc-snippets

" store system kernel in a variable
let OS=substitute(system('uname -s'), "\n","","")

" <leader> & <localleader> as a precursor to user defined commands
let mapleader = ','
let maplocalleader = " "

" Basics
set nocompatible
set encoding=utf-8
syntax enable
syntax on
colo ron
set background=dark
set autoread
set wildmenu
set showmatch
set number
set relativenumber


" Tab remap to 4 spaces
filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4


" setGincsearch
" set hlsearch
set ignorecase
set smartcase
nnoremap <leader><space> :nohlsearch<CR>
inoremap jk <esc>

" Backup dir
set backupdir=~/.vim/tmp//,.  " backup files
set directory=~/.vim/tmp//,.  " swap files


" Normal Mode Key Mappings
"	Replace all words aliased to S, with Confirmation
nnoremap S :%s//gc<left><left><left>

nnoremap <leader>w :w<CR>
nnoremap <leader>m :q<CR>
nnoremap <leader>n :q!<CR>
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap gV '[v']
nnoremap <leader>s :mksession<CR> 

" Visual Mode Key Mappings
vnoremap s :s//g<left><left>
vnoremap S :s//gc<left><left><left>


" Insert Mode key mappings
" -> exit insert mode
inoremap jk <Esc>   
" -> jump out of {}[]() etc.
inoremap <leader>l <ESC>la
inoremap <S-Tab> <C-V><Tab>

" For seeing unused whitespace and end-of-line
set listchars=space:⋅,eol:¬
nnoremap <leader><leader> :set list!<CR>

" Disable automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" LaTeX Settings "
"   ultisnips settings
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"   vimtex settings 
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:vimtex_view_forward_search_on_start=0
let g:vimtex_view_method='zathura'

"if (OS == "Darwin")
"    let g:vimtex_view_method='skim'
"else 
"    let g:vimtex_view_method='zathura'
"endif

"   tex-conceal settings
set conceallevel=1
let g:tex_conceal='abdmg'

"   spell checking 
"setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"   auto-save options 
let g:auto_save_silent = 1  " do not display auto-save notification
nnoremap <localleader>w :AutoSaveToggle<CR>

" NerdCommenter options
let NERDSpaceDelims = 1

" Indent levels in code settings
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1



" echo has('clipboard')
" If 1, then yes and set the next line
set clipboard=unnamedplus

" If 0, then
" sudo apt install vim-gtk3
" then set clipboard


let &t_ut=''

