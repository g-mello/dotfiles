" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" Plugin manager Vundle
set rtp+=~/.vim/vundle.git/ 
call vundle#rc()


" My Bundles
" Original repos on github
"
"" NerdTree file project manager"
"Bundle 'scrooloose/nerdtree'
" git clone https://github.com/scrooloose/nerdtree.git

"" ControlP-Vim fuzzy file project manager"
Bundle 'kien/ctrlp.vim'
" git clone https://github.com/kien/ctrlp.vim.git "

" Jedi python autocompletion code
""Bundle 'davidhalter/jedi'
" git clone https://github.com/davidhalter/jedi.git
 
" Jedi-Vim python autocompletion code
""Bundle 'davidhalter/jedi-vim'
" git clone https://github.com/davidhalter/jedi-vim.git 

" Vim-Powerline enables a better looking and more funcional status-line
Bundle 'Lokaltog/vim-powerline'
" git clone https://github.com/Lokaltog/vim-powerline.git

" Python-Mode Python-mode is a vim plugin that helps you to create python code
" very quickly
"Bundle 'klen/python-mode'
" git clone https://github.com/klen/python-mode.git
 
" YouCompleteMe is fast fuzzy-search code completion engine for Vim
" C/C++/Objective-C/Objective-C++/Python/...
Bundle 'Valloric/YouCompleteMe' 
" git clone https://github.com/Valloric/YouCompleteMe.git

" UltiSnips is the ultimate solution for snippets in Vim
"Bundle 'SirVer/UltiSnips'
" git clone https://github.com/SirVer/ultisnips.git

" Snipets are separated from the engine. Add this if you want them:
"Bundle 'shivakar/vim-snippets'

" Syntastic is a syntax checking for many languages
Bundle 'scrooloose/syntastic'
" git clone https://github.com/scrooloose/syntastic.git

" Arduino-syntax-file 
Bundle 'vim-scripts/Arduino-syntax-file'
" git clone https://github.com/vim-scripts/Arduino-syntax-file



" Vim Scripts
" Non github repos
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


"" NERDTree stuff 
" Use NERDTree as split explorer instead of project drawer
"let NERDTreeHijackNetrw=1
"
" Automatic loading of NerdTree
"autocmd vimenter * NERDTree
"
" Automatic loading of NerdTree for new files
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
" Automatirc close of NerdTree when close vim
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"" Ultisnips stuff
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<c-E>" 
let g:UltiSnipsJumpForwardTrigger="<c-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>" 
let g:UltiSnipsUsePythonVersion=2
"If you want :UltiSnipsEdit to split you window let
let g:UltiSnipsEditSplit="vertical"


" YCM stuff
"In order to auto-complete source-code for C-family, you should provide custom
".ycm_extra_conf.py file for your project. 
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"


" Syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_id_checkers = 0
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting  = 1
let g:syntastic_auto_jump = 2 
let g:ycm_show_diagnostics_ui = 1
let g:syntastic_c_clang = "/usr/bin/clang"
let g:syntastic_c_checkers = ["splint", "clang", "gcc"]

highlight SyntasticErrorSign guibg=white guifg=red
highlight SyntasticWarningSign guibg=green guifg=yellow
highlight SyntasticError guibg=white guifg=red
highlight SyntasticWarning guibg=green guifg=yellow


" Better copy & paste When you want to paste large blocks of code into vim,
" press F2 before you paste. At the bottom you should see ``-- INSERT (paste)
" --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Using Ctrl + T to create new tab
map <C-T> :tabnew<CR>

" Tab navigantion
nnoremap <Return> <C-]>
nnoremap <leader>b <C-o>

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>
 

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
"for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
"" call pathogen#infect()


" ============================================================================
" Python IDE Setup
" ============================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1 
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
""let g:jedi#usages_command = "<leader>z"
""let g:jedi#popup_on_dot = 0
""let g:jedi#popup_select_first = 0
""map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
     if pumvisible()
         if a:action == 'j'
             return "\<C-N>"
         elseif a:action == 'k'
             return "\<C-P>"
         endif
     endif
     return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable



