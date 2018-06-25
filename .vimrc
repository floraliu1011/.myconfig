" Modeline and Notes {
" " vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" " }

" Environment setup {
    " use vim setting instead of Vi setting
    " better to be as early as possible since it has side effect
    set nocompatible

    " Attempt to make airline to work
    set t_Co=256

    set encoding=utf-8
" }

" General {

    "Allow usage of mouse in iTerm
    set ttyfast
    set mouse=a

    "Allow wrapping of cursor keys
    set whichwrap+=<,>,h,l,[,]

    "set backspace=2   " Backspace deletes like most programs in insert mode
    set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
    set nobackup
    set nowritebackup
    set history=100
    set ruler         " show the cursor position all the time
    set showcmd       " display incomplete command
    set autowrite     " Automatically :write before running commands
    set autoread      " Reload files changed outside vim
    " Trigger autoread when changing buffers or coming back to vim in terminal.
    au FocusGained,BufEnter * :silent! !


    set tabstop=2
    set shiftwidth=2
    set expandtab
    set smarttab
    set smartindent
    set autoindent

    " Editing {

        filetype plugin indent on

        " fix the stupid backspace
        set backspace=indent,eol,start

        """ SYSTEM CLIPBOARD COPY & PASTE SUPPORT
        set pastetoggle=<F2> "F2 before pasting to preserve indentation
        " TODO: figure out what it is doing
        ""Copy paste to/from clipboard
        "vnoremap <C-c> "*y
        "map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
        "map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"

        " Insert line without entering insert mode
        nmap <S-Enter> o<Esc>
        nmap <C-S-CR> o<Esc>
    " }

    " Searching {
        " Make searching better
        set ignorecase    " case insensitive searching (unless specified)
        set smartcase
        set hlsearch
        nnoremap <silent> <leader>\ :noh<cr> " Stop highlight after searching
        set incsearch
        set showmatch
    "}

" }

" Install Plugins {
	"Download Vim-Plug if it isn't there yet
	if empty(glob('~/.vim/autoload/plug.vim'))
  		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif

	" https://github.com/junegunn/vim-plug
    	call plug#begin('~/.vim/plugged')

	" General {

    " User Interface {

        " airline at the bottom
        Plug 'vim-airline/vim-airline'

        " airline themes
        Plug 'vim-airline/vim-airline-themes'

        " god I need a clock:(
        Plug 'enricobacis/vim-airline-clock'

        " a nice colorscheme
        Plug 'junegunn/seoul256.vim'
        Plug 'sts10/vim-pink-moon'

        " Tmux status line
        Plug 'edkolev/tmuxline.vim'

    " }

    " fuzzy search with fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " allowing unix command (with capital) in vim
    Plug 'tpope/vim-eunuch'

    " Vertical line to show vertical alignment and identation
    Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }

    " File explorer
    Plug 'scrooloose/nerdtree'

    " Turn vim into excel
    Plug 'chrisbra/csv.vim'

    " Allow multiple cursors
    Plug 'terryma/vim-multiple-cursors'

    " Auto code inspection
    Plug 'w0rp/ale'

    " Swap windows with <leader>ww
    Plug 'wesQ3/vim-windowswap'

    " Git diff in sign column
    Plug 'airblade/vim-gitgutter'

    " Separate buffer for stage and commit
    Plug 'jreybert/vimagit'

    " Git wrapper for vim
    Plug 'tpope/vim-fugitive'

    " highlight trailing whitespace (remove by :FixWhitespace
    Plug 'bronson/vim-trailing-whitespace'

    " autocomplete brackets
    Plug 'Raimondi/delimitMate'

    " Diary, notes, whatever. It's amazing
    Plug 'vimwiki/vimwiki'

    " block comment
    Plug 'tpope/vim-commentary'

    " smooth scrolling
    Plug 'yuttie/comfortable-motion.vim'

    " easy motion (lots of shortcuts
    Plug 'easymotion/vim-easymotion'

    " " easy align
    " Plugin 'junegunn/vim-easy-align'

    " Snips -- use SnipMate for snip engine
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'garbas/vim-snipmate'
    Plug 'honza/vim-snippets'

    " autocomplete prompt
    Plug 'vim-scripts/AutoComplPop'

    " rename the current buffers
    Plug 'danro/rename'


	" }


	" Languages {
    " Plugs for language support
	  Plug 'sheerun/vim-polyglot'

    " R plugins {
	        " Turn vim into R IDE
          Plug 'jalvesaq/Nvim-R'
      " }
      "
      " HTML plugins {
      " Auto tag completion by sparkup <c-e>,
      Plug 'rstacruz/sparkup'

      " Open a browser to preview markdown files
      Plug 'suan/vim-instant-markdown', {'do': 'npm install -g instant-markdown-d'}

      " easily surround stuff
      Plug 'tpope/vim-surround'
      " }


	" }
  "

  " Initialize plugin system
	call plug#end()
" }

" User Interface {

     set number
     syntax on
     set colorcolumn=90

    " relative numbering
    "Toggle relative numbering, and set to absolute on loss of focus or insert mode
    set rnu
    function! ToggleNumbersOn()
        set nu!
        set rnu
    endfunction
    function! ToggleRelativeOn()
        set rnu!
        set nu
    endfunction
    autocmd FocusLost * call ToggleRelativeOn()
    autocmd FocusGained * call ToggleRelativeOn()
    autocmd InsertEnter * call ToggleRelativeOn()
    autocmd InsertLeave * call ToggleRelativeOn()

      " airline {
      " airline theme
      let g:airline_theme='light'

      let g:airline_powerline_fonts = 1
      let g:airline_section_b = '%{getcwd()}'
      let g:airline#extensions#branch#enabled = 1
      let g:airline#extensions#ale#enabled = 1


    " }

     " colorscheme {
        " choose a colorscheme
        " colorscheme pink-moon

        "" pink-moon colorscheme {
        "     set background=dark
        "" }

        "" seoul colorscheme {

          " seoul256 (dark):
          "   Range:   233 (darkest) ~ 239 (lightest)
          "   Default: 237
          let g:seoul256_background = 238
          colo seoul256

          "" seoul256 (light):
          ""   Range:   252 (darkest) ~ 256 (lightest)
          ""   Default: 253
          "let g:seoul256_background = 256
          "colo seoul256
       "  }

      " NERDTree {
        " Open NerdTree when start
        autocmd vimenter * NERDTree

        "  Autometically open Nerdtree when start with no dir opened
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

        " Autometically open NerdTree when open a directory
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

        " close vim if the only window left open is a NERDTree
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " }

    " indentLine {
       set expandtab
       set tabstop=2
       set shiftwidth=2

       let g:indentLine_color_term = 239
       let g:indentLine_char = 'c'
    " }

    "" set cursorline                  " highlight current line

    hi CursorLine guibg=#ffffff     " highlight bg color of current line
    hi CursorColumn guibg=#333333   " highlight cursor
    hi TermCursor ctermfg=red       " TODO: Fixthis
" }

" }

" Keymaps {

    " Basic keymaps {

        " Keymaps for daily usage
        " Remap the <leader> key to ;
        let mapleader = ";"

        " ,y and ,p allow copy and paste between different vim sessions
        vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
        nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
        map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
        map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

        " Ctrl + direction to quickly switch between panes
        noremap <C-l> <C-w>l
        noremap <C-h> <C-w>h
        noremap <C-j> <C-w>j
        noremap <C-k> <C-w>k
        nnoremap <S-H> gT
        nnoremap <S-L> gt


        "Map Ctrl + S to save in any mode
        nnoremap <C-s> :update<CR>
        vnoremap <C-s> :<esc>update<CR>
        inoremap <C-s> :<esc>update<CR>

        " Quickly close windows
        nnoremap <leader>x :x<cr>
        nnoremap <leader>X :q!<cr>

        " resize panes
        nnoremap <C->> :vertical resize +3<cr>
        nnoremap <C-<> :vertical resize -3<cr>
        nnoremap <C-+> :resize +3<cr>
        nnoremap <C--> :resize -3<cr>

        " Use tab to jump between blocks, because it's easier
        nnoremap <tab> %
        vnoremap <tab> %

        " press <f7> to fix the indentation
        map <F7> mzgg=G`z

    " }

        " Plugin Keymaps {

            " easymotion {

                nmap <silent>f <Plug>(easymotion-bd-w)
            " }

            " fzf {
                " invoking fzf
                map ' :Files<CR>
            " }

            " Nvim-R {
                " Mapping , and ,e to send one line to R session
                " remapping the basic :: send line
                nmap <C-CR> <Plug>RDSendLine
                " " remapping selection :: send multiple lines
                vmap <C-CR> <Plug>RDSendSelection
               "disable auto inserting <-
                let vimrplugin_assign = 0
            " }

            " gitgutter {
                " default keymaps in gitgutters
                nmap ]c <Plug>GitGutterNextHunk
                nmap [c <Plug>GitGutterPrevHunk
                nmap <Leader>hs <Plug>GitGutterStageHunk
                nmap <Leader>hu <Plug>GitGutterUndoHunk
            " }

            " NerdTree {
                " Toggle NerdTree by bunching Ctrl+t
                map <C-t> :NERDTreeToggle<CR>
            "}

            " SwapWindow {
                let g:windowswap_map_keys = 0 "prevent default bindings
                nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
                nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
                nnoremap <silent> <leader>sw :call WindowSwap#EasyWindowSwap()<CR>
            " }

            " vimwiki {

                " Lists
                nmap <M-+> <Plug>VimwikiIncrementListItem
                vmap <M-+> <Plug>VimwikiIncrementListItem
                nmap <M--> <Plug>VimwikiDecrementListItem
                vmap <M--> <Plug>VimwikiDecrementListItem

                " checkboxes
                nmap <Leader><Space> <Plug>VimwikiRemoveSingleCB
            " }
        " }
    " }
" }

" Aliases {

    " General {
        " open a file in a new tab by typing :ta <somefile>
        :ab te tabedit

        " trim all whitespaces
        :ab trim %s/\s\+$//
    " }

    " Plugin {

    " }
" }

" Plugin configuration {
        " NERDTree {
        " always show dot files in
        let NERDTreeShowHidden=1

        " abbreviate bookmark command
        :ab bm bookmark
        " }

        " fzf {
              function! s:find_home()
                return system('/')
              endfunction

              command! ProjectFiles execute 'Files' s:find_home()
        "}

        "ALE {
              " allow hovering the lint
              let g:ale_set_balloons=1
        "}
" }

" " Quick .vimrc updating {
    " Source the vimrc file after saving it
    if has("autocmd")
        " Prevent repeating autocommands
        augroup vimrc
            " Clear group before a re-source
            autocmd!
            exec "autocmd bufwritepost " . expand("<sfile>:t") . " source $MYVIMRC"
        augroup END
    endif

    " Map opening the .vimrc
    exec "nnoremap <leader>` :e " . expand("<sfile>:p") . "<CR>"
" }

