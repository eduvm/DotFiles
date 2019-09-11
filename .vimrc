set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Basics
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'pgilad/vim-skeletons'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'enricobacis/vim-airline-clock'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Colorschemes
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kristijanhusak/vim-hybrid-material'

" Coding
Plugin 'lervag/vimtex'        " LaTeX
Plugin 'sheerun/vim-polyglot' " Polyglot

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"####################
" Table of Contents #
"####################
" 1. General
" 2. Hotkeys
" 3. Text, tab, indent
" 4. Moving around
" 5. Colors and Fonts
" 6. Plugins
" 6.1 Syntastic
" 6.2 Airline
" 6.3 Nerdtree
" 6.4 Nerdcommenter
" 6.5 Vimtex
" 6.6 Tagbar
" 6.7 Snippets
" 6.8 Polyglot
" 6.9 Skeletons
" 6.10 CtrlP
" 7. Coding
" 7.1 I3WM


"#####################
"     1. General     #
"#####################
syntax on

set autoread " Auto read files when changed outside
set mouse =a
set lines=50
set columns=100
set splitright " Put new buffer on the right of current buffer
set splitbelow " Put new buffer below the current buffer
set guiheadroom=0
set smartcase " When searching try to be smart about cases
set ignorecase " When searching
set number
set nobackup
set nowb
set noswapfile

let g:tex_flavor = "latex" " Auto detect latex filetype


"#####################
"     2. Hotkeys     #
"#####################
map <F7> gg=G<C-o><C-o> " Reindent

map <leader>T :%s/\s\+$//<CR> " <leader>T = Delete all trailing space in file

map <leader>R :retab<CR> " <leader>R = Converts tabs to spaces in file

" Edit and reload .vimrc file
nmap <silent> <leader>ev :e  $MYVIMRC<CR>
nmap <silent> <leader>es :so $MYVIMRC<CR>

nnoremap Q <nop> " Wtf is ex mode anyways


"###############################
"     3. Text, tab, indent     #
"###############################
set tabstop=2
set shiftwidth=2 " 1 tab == 2 spaces

set smarttab " Be smart when using tabs
set expandtab " Convert tabs to spaces

"set ai " Auto indent
set si " Smart indent

set wrap " Wrap lines

set foldmethod=marker
set foldlevel=0 " Close every fold by default
set modelines=1 " Modeline would be '" vim:foldmethod=marker:foldlevel=0' at the end of file

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L


"###########################
"     4. Moving around     #
"###########################
" Buffer switching left, down, up, right
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Tab switchting
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>


"##############################
"     5. Colors and Fonts     #
"##############################
set termguicolors
set background=dark

colorscheme hybrid_material
let g:airline_theme='hybrid'

if has("gui_running")   " Set extra options when running in GUI mode.
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

set guifont=Inconsolata:h13
set encoding=utf8


"#####################
"     6. Plugins     #
"#####################
"~~~~~~~~~~~~~~~~~~~~
"   6.1 Syntastic   ~
"~~~~~~~~~~~~~~~~~~~~
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_mode_map = { 'mode': 'passive' } "Enable if you want to disable syntastic on file open
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_quiet_messages = {
    \ "level":  "warnings",
    \ "regex": [
        \ '\m\[C03\d\d\]',
        \ '\mpossible unwanted space at "{"'
        \]}


"~~~~~~~~~~~~~~~~~~
"   6.2 Airline   ~
"~~~~~~~~~~~~~~~~~~
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_left_sep=''
let g:airline_right_sep=''


"~~~~~~~~~~~~~~~~~~~
"   6.3 Nerdtree   ~
"~~~~~~~~~~~~~~~~~~~
map <F3> :NERDTreeToggle<CR>
map <F4> :Hex<CR>

let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

let NERDTreeIgnore=[
    \ 'node_modules$[[dir]]',
    \ '.git$[[dir]]',
    \ '.vscode$[[dir]]',
    \ '.idea$[[dir]]',
    \ '.DS_Store$[[file]]',
    \ '.swp$[[file]]',
    \ 'hdevtools.sock$[[file]]',
    \ '.synctex.gz[[file]]',
    \ '.fls[[file]]',
    \ '.fdb_latexmk[[file]]',
    \ '.aux[[file]]'
\ ]


" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction


"~~~~~~~~~~~~~~~~~~~~~~~~
"   6.4 Nerdcommenter   ~
"~~~~~~~~~~~~~~~~~~~~~~~~
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1 " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting


"~~~~~~~~~~~~~~~~~
"   6.5 Vimtex   ~
"~~~~~~~~~~~~~~~~~
let g:vimtex_quickfix_ignore_all_warnings = 1
let g:vimtex_quickfix_latexlog = {
    \ 'overfull' : 0,
    \ 'underfull' : 0
    \}


"~~~~~~~~~~~~~~~~~
"   6.6 Tabgar   ~
"~~~~~~~~~~~~~~~~~
nmap <F8> :TagbarToggle<CR>


"~~~~~~~~~~~~~~~~~~~
"   6.7 Snippets   ~
"~~~~~~~~~~~~~~~~~~~
" Vim-addon-manager
fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'

  " Force your ~/.vim/after directory to be last in &rtp always:
  " let g:vim_addon_manager.rtp_list_hook = 'vam#ForceUsersAfterDirectoriesToBeLast'

  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif

  " This provides the VAMActivate command, you could be passing plugin names, too
  call vam#ActivateAddons([], {})
endfun
call SetupVAM()

" Vim-snippets and UltiSnips
ActivateAddons vim-snippets UltiSnips

" UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


"~~~~~~~~~~~~~~~~~~~
"   6.8 Polyglot   ~
"~~~~~~~~~~~~~~~~~~~
" See https://github.com/sheerun/vim-polyglot
let g:polyglot_disabled = ['latex'] " We use vimtex instead of LaTeX-Box


"~~~~~~~~~~~~~~~~~~~~
"   6.9 Skeletons   ~
"~~~~~~~~~~~~~~~~~~~~
let skeletons#autoRegister = 1 " Auto-register for creation of new files


"~~~~~~~~~~~~~~~~~
"   6.10 CtrlP   ~
"~~~~~~~~~~~~~~~~~
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|target|dist)|(\.(git|hg|svn))$',
  \ 'file': '\v\.(exe|so|dll|DS_Store)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


"####################
"     7. Coding     #
"####################
"~~~~~~~~~~~~~~~
"   7.1 I3WM   ~
"~~~~~~~~~~~~~~~
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
