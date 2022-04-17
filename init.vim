" vim:fdm=marker
" Identify platform {{{

silent function! Neovim()
return has('nvim')
endfunction
" }}}
" Basic {{{

language en_US.utf8
set number                      "Line numbers are good
" set relativenumber              "relative numbering
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
" set gcr=a:blinkon0              "Disable cursor blink
set autoread                    "Reload files changed outside vim
set cursorline                  "highlight the current line
set colorcolumn=100
set hidden
syntax on
let mapleader=","
scriptencoding utf-8
set encoding=utf-8
set splitright
set splitbelow
set pastetoggle=<F12>

" hide menu
set guioptions-=T

" no blibking in gvim
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
"Swap files
set noswapfile
set nobackup
set nowb

set copyindent
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

set list listchars=tab:\ \ ,trail:·

set wrap!       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

set foldnestmax=15
set foldenable
set foldminlines=2
set foldlevel=0
set foldlevelstart=1

au FileType yaml set foldmethod=indent
au FileType yaml set foldlevel=1
au FileType typescript set foldmethod=syntax
au FileType typescript set foldlevel=1
au FileType javascript set foldmethod=syntax
" au FileType javascript set foldmethod=indent
au BufRead,BufWinEnter *.html,*.xml,*.xhtml set foldmethod=indent

"competion

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*node_modules/**
set wildignore+=*bower_components/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=**/.angular/**
set wildignore+=*.png,*.jpg,*.gif

set wildignore+=*Lightness/scripts/**
set wildignore+=*.vbproj

set clipboard=unnamedplus
set hlsearch
set ignorecase
set smartcase
set incsearch

set laststatus=2
" Broken down into easily includeable segments
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

set updatetime=200

vnoremap <C-h> ""y:%s/<C-R>=escape(@", '/\')<CR>//g<Left><Left>

" }}}
" Appearance {{{

set termguicolors
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set guioptions-=r
set guioptions-=L

" }}}

" Plug {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'HerringtonDarkholme/yats.vim'
Plug 'PProvost/vim-ps1'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Yggdroot/LeaderF'
Plug 'airblade/vim-rooter'
Plug 'andbar-ru/vim-unicon'
Plug 'andymass/vim-matchup'
Plug 'chrisbra/Colorizer'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'eesdil/vim-themes'
Plug 'eugen0329/vim-esearch'
Plug 'honza/vim-snippets'
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'mhinz/vim-janah'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'pantharshit00/vim-prisma'
Plug 'ruanyl/coverage.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wimstefan/vim-artesanal'

" Disabled
" Plug 'JamshedVesuna/vim-markdown-preview'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'airblade/vim-gitgutter'
" Plug 'aklt/plantuml-syntax'
" Plug 'altercation/vim-colors-solarized'
" Plug 'dense-analysis/ale'
" Plug 'janko-m/vim-test'
" Plug 'jeffkreeftmeijer/vim-dim'
" Plug 'nelstrom/vim-markdown-folding'
" Plug 'rakr/vim-one'
" Plug 'reedes/vim-colors-pencil'
" Plug 'romainl/Apprentice'
" Plug 'sbdchd/neoformat'
" Plug 'tomasiser/vim-code-dark'
" Plug 'tpope/vim-markdown'

call plug#end()
" }}}

let g:dracula_colorterm = 0
colorscheme dracula
" let g:one_allow_italics = 1
" let g:airline_theme='one'
let vim_markdown_preview_github=1

let g:coverage_json_report_path = 'coverage/coverage.json'
let g:coverage_sign_covered = '⦿'
let g:coverage_interval = 5000

" fzf {{{
if has("nvim")
  tnoremap <Esc> <c-\><c-n>
endif
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
nmap <C-p> :GFiles<CR>
nmap <C-b> :Buffers<CR>
nmap <C-h> :History<CR>
nmap <C-m> :Marks<CR>
" nmap <C-P> :Commands<CR>
" }}}
" Rooter {{{
let g:rooter_patterns = ['.git/']
" let g:rooter_patterns = ['package.json']
" }}}
" NERDTree {{{

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore=[
            \ '\~$',
            \ '\.js\.map$',
            \ '\.css'
            \ ]
" let NERDTreeIgnore=['\.vim$', '\~$']
let NERDTreeRespectWildIgnore = 0

map <C-e> :NERDTreeToggle<CR>
map <silent> <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

" Close it automatically if this is the only window open
" autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif
" }}}
" Fugitive {{{
set previewheight=20
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gd :Gvdiffsplit<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gl :Gclog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>
nnoremap <silent> <leader>gm :Git log --graph --all --pretty=tformat:"\%C(yellow)\%h\%Creset\%C(cyan)\%C(bold)\%d\%Creset \%C(cyan)(\%cr)\%Creset \%C(green)\%ce\%Creset \%s"<CR>
" }}}
" tcomment {{{
map <Leader>c<space> :TComment<CR>
map <D-/> :TComment<CR>
imap <D-/> <Esc>:TComment<CR>i
let g:tcomment#replacements_xml={}

call tcomment#type#Define('java', '// %s')
call tcomment#type#Define('typescript', '// %s')
call tcomment#type#Define('sqlserver', '-- %s')
" }}}
" EasyMotion {{{
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" }}}
" startify {{{
let g:startify_session_persistence = 1
" }}}
" Terminal {{{
:tnoremap <Esc> <C-\><C-n>
" }}}
" Custom mappings {{{
" Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

nmap <silent> <leader>f0 :set foldlevel=0<CR>
nmap <silent> <leader>f1 :set foldlevel=1<CR>
nmap <silent> <leader>f2 :set foldlevel=2<CR>
nmap <silent> <leader>f3 :set foldlevel=3<CR>

nnoremap * m`:keepjumps normal! *<cr>``
" }}}
" Typescript {{{
au FileType typescript map <C-]> :TSDef<CR>
au FileType typescript map <C-.> :TSImport<CR>
au FileType typescript nmap <leader>i :TSImport<CR>
au FileType typescript nmap <leader>r :TSRefs<CR>
au FileType typescript nmap <leader>m :TSRename<CR>
au FileType typescript nmap <leader>t :TSType<CR>

" }}}
" Deoplete  {{{
let g:deoplete#enable_at_startup = 1
" }}}
" Neosnippet {{{
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" }}}
" Ale {{{
" let g:ale_fix_on_save = 1
" let g:ale_set_highlights = 0
" let g:ale_sign_column_always = 1
" let g:ale_fixers = {
"             \   'javascript': ['prettier'],
"             \   'typescript': ['prettier'],
"             \   'html': ['prettier'],
"             \   'css': ['prettier'],
"             \}
" let g:ale_sign_error = '•'
" let g:ale_sign_warning = '•'
" let g:airline#extensions#ale#error_symbol='• '
" let g:airline#extensions#ale#warning_symbol='• '

" let g:ale_completion_enabled = 1
" }}}
" Open in browser {{{
nnoremap <leader>of :exe ':silent !open -a /Applications/Firefox.app %'<CR>
nnoremap <leader>oc :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <leader>og :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <leader>os :exe ':silent !open /Applications/Safari.app %'<CR>
" }}}
" The Silver Searcher {{{
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
endif

command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" }}}
" Indent guides {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_color_change_percent = 2
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1
" }}}

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap <leader>w :StripTrailingWhitespaces<CR>

function! MyFoldText()
    let nblines = v:foldend - v:foldstart + 1
    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let line = getline(v:foldstart)
    let comment = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    let expansionString = repeat(".", w - strwidth(nblines.comment.'"'))
    let txt = '' . comment . expansionString . nblines
    return txt
endfunction
set foldtext=MyFoldText()
" }}}
