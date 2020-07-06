" ~/.vimrc
" ~~~~~~~~
" about {{{
"
" what's new?
" titlecase.pl (tc) | <leader>c
" lexical: set spell, ]s jump to spelling error, <leader>s spelling suggestions, <leader>t thesaurus
" gt operator for Title Case
" NERDTree | <C-e>
" UltiSnip | <C-j> Expand
" remove highlight | space space space
" ALE | :ALEFix | Proselint for org
" vim-orgmode
" <leader>C - close all buffers but current
"
" }}}
" vim-plug {{{
" https://github.com/junegunn/vim-plug
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim-plug/plugged')

" Tim Pope deserves its own section
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-dispatch'

" productivity
Plug 'SirVer/ultisnips'
Plug 'haya14busa/incsearch.vim'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-scripts/BufOnly.vim'
Plug 'yggdroot/indentline'
" Plug 'AlphaMycelium/pathfinder.vim'
" Plug 'honza/vim-snippets'
" Plug 'bradurani/vim-powerclose'
" Plug 'junegunn/vim-easy-align'
" Plug 'vim-scripts/restore_view.vim'
" Plug 'Shougo/unite.vim'
" Plug 'kabbamine/zeavim.vim'
" Plug 'majutsushi/tagbar'
" Plug 'vim-scripts/dbext.vim'
" Plug 'valloric/youcompleteme', { 'do': './install.py' }

" beauty in the eye of the beholder
Plug 'reedes/vim-colors-pencil'
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/carrot.vim'
Plug 'vim-scripts/rainbow_parentheses.vim'

" syntax support, I guess
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
" Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
" Plug 'python-mode/python-mode'
" Plug 'isruslan/vim-es6'
" Plug 'PProvost/vim-ps1'
" Plug 'mattn/emmet-vim'
" Plug 'vim-scripts/Align'
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'marijnh/tern_for_vim', {'do': 'npm install'}
" Plug 'vim-scripts/SQLUtilities'
" Plug 'vim-scripts/gnuplot.vim'

" this needs patched nerd fonts
Plug 'ryanoasis/vim-devicons'

" produce and be bountiful
Plug 'wakatime/vim-wakatime'

" are you crazy? you're goint to kill us all
Plug 'jceb/vim-orgmode'

" the pen is mightier than the sword
Plug 'kana/vim-textobj-user'
Plug 'dbmrq/vim-ditto'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-textobj-quote'
Plug 'junegunn/goyo.vim'

call plug#end()

" }}}
" general options {{{

filetype plugin indent on
syntax enable
set conceallevel=0
set clipboard=unnamedplus

" encoding
set shortmess=at
set cmdheight=2
set encoding=utf-8
"set fileencoding=utf-8
"set fileencodings=utf-8
set fileformats=unix,dos,mac

" main options
set viewdir=$HOME/.cache/vim
set timeoutlen=1200
set ttimeoutlen=10
set synmaxcol=300                  " speed up vim with long files
set nocompatible                   " disable vi compatibility
set modelines=1                    " read last n lines for file specific vim options
"set undofile                      " creates .un~ files
set tags+=tags;/                   " find tags file upwards up to fs root
set tags+=tags.d;/
set history=9999                   " big old history
set nomore
set mouse=a                        " use mouse everywhere
set mousehide
set virtualedit=block
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " ignore some types of files
set helpheight=99999                " full window help
set secure
set t_Co=256
let g:netrw_liststyle=1

" paragraph formatting
set formatprg=par\ -w80

" directory for swp files
if has("win32")
    set dir=.,$TEMP,c:\tmp,c:\temp
else
    silent !mkdir ~/.cache >/dev/null 2>&1
    silent !mkdir ~/.cache/vim >/dev/null 2>&1
    set dir=~/.cache/vim
endif

" indentation
set autoindent
"set cindent
"set smartindent

" tabulation
set expandtab                      " convert tabulation to spaces
set tabstop=4                      " tabulation to blanklines ratio
set softtabstop=4
set shiftwidth=4
set shiftround

" visible controls
set showmode                       " show mode on status bar
set showcmd                        " show always command in status bar
set hidden
set wildmenu                       " complete commands with TAB
set wildmode=list:longest
set visualbell
set noerrorbells                   " don't make noise
" set cursorline                     " highlight cursor line
" set cursorcolumn                   " higtlight cursor column
" set colorcolumn=79
set formatoptions=j
set ttyfast
set lazyredraw
set ruler
set backspace=indent,eol,start     " make backspace more flexible
set laststatus=2
set number                         " absolute line number
set relativenumber                 " relative line num from current
set numberwidth=4
set scrolloff=5                    " number of lines to retain when scrolling
set sidescrolloff=10               " Keep 5 lines at the size
set report=0                       " notify when lines are changed
set title
set titlestring=vim\ %f

" search
set ignorecase                     " ignore case when searching
set smartcase
set gdefault                       " asume /g on all substitutions
set incsearch                      " highlight as searching
set showmatch                      " show matching brackets
set hlsearch

" mouse support
set mouse=a

" be very magic
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

" use %% to reference path to current buffer
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"set clipboard=unnamedplus

" wrapping
" set wrap
" set linebreak
" set textwidth=0
" set wrapmargin=0

"set formatoptions=qrn1
"set colorcolumn=80

" }}}
" key mappings {{{

" edit & reload config
nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

" change <leader>
" tradition dictates to use , but i'm trying Space
" some plugins check also for g:mapleader (NERDCommenter)
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" reset search highlight with <leader>+space
nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %

" jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" use jj to change to normal mode
inoremap jj <ESC>

" unmap F1 help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" CTRL+direction to move across windows
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-h> <c-w>h
"map <c-l> <c-w>l

" make Y yank from cursor to end of line
"map Y y$

"set Y to duplicate line or selection
nmap Y yyp
vmap Y y`>pgv

"nmap o o<ESC>
"nmap O O<ESC>

" insert newlines
map <C-Enter> o<Esc>k
map <S-Enter> O<Esc>j
"nmap <C-Enter> o<Esc>k
"nmap <S-Enter> O<Esc>j
"nmap <CR> o<Esc>k

" for perl files - generate tags
"map <leader>t :!plt<CR>
"map <leader>T :!plt -d<CR>

" use <leader>m to run make - change makeprg accodingly
map <leader>m :make<CR><CR>

nmap <leader>f yyP<leader>ccj

nmap <leader>e :Explore<CR>

xnoremap <leader>c :!tc<CR>

" common actions
noremap <leader>w :w<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" quickfix navigate
noremap <leader>n :cn<CR>
noremap <leader>N :cp<CR>

" use ñ to access registers (" is too awkward on spanish keyboards)
nmap ñ "


" }}}
" ALT key mappings for 7bit terminals - vim {{{

" when running plain vim on a 7-bit term alt combinations
" are escaped like: ALT+A = a

" nvim automatically corrects 7bit terminals
" so this is not needed

if ! has('nvim')

    set ttymouse=xterm2

    " use ALT-V to paste X clipboard
    "inoremap <a-v> <ESC>"+gP
    "nnoremap <a-v> "+gP
    "vnoremap <a-v> "+gP

    " use ALT-A to select all text on buffer (only works in GUI :/ )
    map a <ESC>ggVG

    " close windows
    map q :close<CR>

    " split
    map - :split<CR>
    map \| :vsplit<CR>

    " buffers
    map { :tabnext<CR>
    map } :tabprevious<CR>

    " tabs
    map , :bp<CR>
    map . :bn<CR>

    " windows
    map h :wincmd h<CR>
    map l :wincmd l<CR>
    map k :wincmd k<CR>
    map j :wincmd j<CR>

endif

" }}}
" ALT key mappings for 8bit terminals and nvim {{{

" when running on a 8bit terminal or using nvim it reads the alt combinations
" as single characters instead of escaped sequences
" so I duplicate 8bit versions of ALT combinatios here

" use ALT-A to select all text on buffer (only works in GUI :/ )
map <a-a> <ESC>ggVG

" close windows
map <a-q> :close<CR>

" split
map <a--> :split<CR>
map <a-\|> :vsplit<CR>

" buffers
map <a-{> :tabnext<CR>
map <a-}> :tabprevious<CR>

" tabs
map <a-,> :bp<CR>
map <a-.> :bn<CR>

" windows
map <a-l> :wincmd l<CR>
map <a-h> :wincmd h<CR>
map <a-k> :wincmd k<CR>
map <a-j> :wincmd j<CR>

" }}}
" abbreviations {{{

cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

" }}}
" colorscheme {{{

" color peachpuff

set background=light
" set background=dark
colorscheme pencil
let g:pencil_terminal_italics = 1

" }}}
" gui only options{{{

if has("gui_running")
    if has("gui_win32")
        set guifont=Consolas:h11:cANSI
    else
        " colorscheme slate
        "set guifont=Droid\ Sans\ Mono\ 12
        "set guifont=Monaco\ 12
        "set guifont=Meslo\ LG\ S\ for\ Powerline\ 9
        set guifont=Deja\ Vu\ Sans\ Mono\ 12
        colorscheme coda
        "set guifont=Inconsolata\ 14
        " set guifont=MesloLGL\ Nerd\ Font
        " set guifont=ProFontIIx\ Nerd\ Font\ Mono\ 13
        set guioptions=caegimt
    endif

    " colorscheme shobogenzo

    " change cursor when normal vs insert
    let &t_SI = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" }}}
" nvim only options {{{

    " doesnt work with tmux
" if has('nvim') || has('termguicolors')
"   set termguicolors
" endif

if has('nvim')

    " custom nvim config
    "let g:python_host_prog='/path/to/python'

    " terminal mappings: use ESC to exit :terminal
    tnoremap <Esc> <C-\><C-n>
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l

endif

" }}}
" functions & commands {{{

" Find Less than 10 (1digit)
command Ltt /\s[0-9]\s
command Bbb '<,'>v/^|[^|]\+\%27v|/ s/\(^|[^|]\+\)|/\1 |/
" Delete trailing whitespaces
command Dtw %s/\s\+$//
" Sort CSS elements
command Scss :g/{/ .+1/}/-1 sort
" convert csv bank statements
command Hbi :%!sed "s:^\([0-9]\+\)/\([0-9]\+\)/\([0-9]\+\),:20\3-\1-\2,:" | tac
" command Tc :s/\<\(a\|an\|the\)\@!\&\w\+\>/\=toupper(submatch(0)[0]).submatch(0)[1:]/g

function! ShowKeybind()
    redir! > /tmp/vim_keymaps
    silent verbose map
    redir END
    view /tmp/vim_keymaps
endfunction

" }}}
" autocmds & filetypes {{{

" autoreload vim config
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,init.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
" format options, disable autocomment and autowrapping for all files
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o list listchars=tab:▸\ ,eol:¬

" remove trailing whitespaces automatically for some types
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python,perl,vim,ps1,markdown,org
            \ autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" use tabs on certain files (makefile,etc)
autocmd FileType make setlocal noexpandtab
autocmd FileType neosnippet setlocal noexpandtab

set nocompatible
filetype plugin on       " may already be in your .vimrc

" text formats
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,org,text,textile call pencil#init({'wrap': 'soft', 'autoformat': 0})
                            \ | call lexical#init({ 'spell': 0 })
                            \ | call ditto#dittoOn()
                            \ | call litecorrect#init()
                            \ | call textobj#quote#init()
augroup END

augroup orgmode
    autocmd FileType org let b:dispatch = "pandoc -f org -t gfm -o /tmp/out.md %"
augroup END

" NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"map M :w<CR>:make<CR>
"set makeprg       - change what :make does

" }}}

" plugin options

" vim-lexical {{{

let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]
let g:lexical#thesaurus_key = '<leader>t'
let g:lexical#spell_key = '<leader>s'
" let g:lexical#dictionary_key = '<leader>k'

" }}}
" ultisnips {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsSnippetsDir=expand('~/.vim/UltiSnips')

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " UltiSnips triggering, alternative
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" }}}
" NERDTree {{{

map <C-e> :NERDTreeToggle<CR>

" }}}
" vim-airline {{{

" show buffer line on top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2
"g:airline#extensions#whitespace#enabled = 1 let
"g:airline#extensions#whitespace#symbol = '!'

" use powerline fonts
let g:airline_powerline_fonts=1

" integrate with other pluginssyntastic
let g:airline#extensions#syntastic#enabled = 1
" let g:airline#extensions#csv#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

" integration with ctrlp
" let g:airline#extensions#ctrlp#show_adjacent_modes = 1
" let g:airline_theme='molokai'
let g:airline_theme='pencil'

" }}}
" indentLine {{{

let g:indentLine_char = '¦'
let g:indentLine_noConcealCursor=""
let g:indentLine_concealcursor = ""
let g:indentLine_conceallevel = 0


" }}}
" incsearch {{{

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" }}}
" rainbow parenthesis {{{

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" }}}
" ALE {{{

" Enable completion where available.
" let g:ale_completion_enabled = 1

" org-mode files should be trated as text
let g:ale_linter_aliases = {'org': 'text'}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
" let g:ale_fix_on_save = 1

" }}}
" syntastic {{{1

" let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" let g:syntastic_error_symbol = 'EE'
" let g:syntastic_style_error_symbol = '⁉️'
" let g:syntastic_warning_symbol = 'WW'
" let g:syntastic_style_warning_symbol = 'WW'

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1


" }}}
" vim-unimpaired {{{

"nmap { [
"omap { [
"xmap { [
"nmap } ]
"omap } ]
"xmap } ]

" Bubble lines
"nmap <C-h> [e
"nmap <C-l> ]e
"vmap <C-h> [egv
"vmap <C-l> ]egv

" insert newlines
"nmap <C-k> [<Space>
"nmap <C-j> ]<Space>
"vmap <C-k> [<Space>gv
"vmap <C-j> ]<Space>gv

" vim-sneak {{{

let g:sneak#streak = 1

" }}}
" vim-slime {{{

let g:slime_target = "tmux"
" let g:slime_default_config = {"socket_name": "default", "target_pane": ":"}

" }}}
" vim-powerclose {{{

nnoremap <leader>q :call powerclose#close()<CR>

" }}}
" tagbar {{{

nmap <F8> :TagbarToggle<CR>
" nmap <tab> :TagbarToggle<CR>
let g:tagbar_width = 35
let g:tagbar_autoclose = 1

" tagbar definition for txt2tags
" for more info :help tagbar and man ctags
" this requires a ctags definition for txt2tags (not provided by default, you need to set it up)
" if you don't have one use this:
" $HOME/.ctags
" ------------
" --langdef=txt2tags
" --langmap=txt2tags:.t2t
" --regex-txt2tags=/^ *(={1,5})([^=].*[^=])\1$/\1 \2/d,definition/
" --regex-txt2tags=/^%!include:\s*(.*)$/\1/m,modules/
" EOF
let g:tagbar_type_txt2tags = {
    \ 'ctagstype' : 'txt2tags',
    \ 'kinds'     : [
        \ 'd:definition:0:1',
        \ 'm:modules:0:1'
    \ ],
    \ 'sort' : 0
\ }


" }}}
" python-mode {{{

" <C-c>ro   organize imports
" <C-c>rr    refactor
" <C-c>r1r  rename module
" <C-c>g    go to definition
" K doc under cursor

let g:python_mode = 1
let g:pymode_python = 'python3'
let g:pymode_run = 1
let g:pymod_run_bind = '<leader>r'
let g:pymode_options_max_line_length = 180

let g:pymode_indent = 1
let g:pymode_motion = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_motion = 1

let g:pymode_lint = 1
let g:pymode_lint_write = 0
let g:pymode_folding = 1
" let g:pymode_lint_ignore = "F401,F403,E501"
let g:pymode_lint_signs = 0
" let g:pymode_lint_checkers = []

let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0

" let g:pymode_syntax_highlight_self = g:pymode_syntax_all
" let g:pymode_syntax_string_formatting = g:pymode_syntax_all
" let g:pymode_syntax_string_format = g:pymode_syntax_all
" let g:pymode_syntax_string_templates = g:pymode_syntax_all
" let g:pymode_syntax_doctests = g:pymode_syntax_all

let g:pymode_doc = 1
let g:pymode_rope_show_doc_bind = 'K'

let g:pymode_rope_lookup_project = 1

" let g:pymode_quickfix_minheight = 12
" let g:pymode_quickfix_maxheight = 24
let g:pymode_lint_cwindow = 0

" }}}
" }}}
" vim-json {{{
" }}}
" vim-dispatch {{{

nnoremap <leader>m :w<CR>:Dispatch!<CR>
" nnoremap <F9> :w<CR>Dispatch<CR>

" }}}
" BufOnly {{{

nnoremap <leader>C :BufOnly<CR>

" }}}


" plugins no longer in use go here to die

" youcompleteme {{{

" let g:ycm_python_binary_path = 'python'
" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" }}}
" unite.vim {{{

" let g:unite_source_grep_command = 'ag'
" let g:unite_source_grep_default_opts = '--no-color -g ""'
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#custom#source('file_rec', 'ignore_pattern', 'venv\|VENV/\|VENV2/\|VENV3/\|node_modules')

" " "nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
" nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
" nnoremap <space>/ :Unite grep:.<cr>
" " let g:unite_source_history_yank_enable = 1
" " nnoremap <space>y :Unite history/yank<cr>
" nnoremap <space>s :Unite -quick-match buffer<cr>


" }}}
" restore_view.vim {{{

" set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\.vim']

" }}}


" vim: foldenable foldmethod=marker
