" Modeline and Notes {
" " vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" " }

" Environment setup {
    " use vim setting instead of Vi setting
    " better to be as early as possible since it has side effect
    set nocompatible
    set hidden

    " Attempt to make airline to work
    set t_Co=256

    set encoding=utf-8

" }

" General {

    "Allow usage of mouse in iTerm
    set ttyfast
    set mouse

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

        filetype plugin on
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

        " Vertical line to show vertical alignment and identation
        Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }


    " }
    
    " Editing {

    " visually show marks 
    Plug 'vim-scripts/ShowMarks'

    " Autocompletion by YouCompleteMe
    Plug 'Valloric/YouCompleteMe'

    " }
    
    " Functional extensions {

      " fuzzy search with fzf
      Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
      Plug 'junegunn/fzf.vim'
      
      " fuzzy inline searching with incsearch
      Plug 'haya14busa/incsearch.vim'
      
      " incsearch integration with ezmotion
      Plug 'haya14busa/incsearch-easymotion.vim'

      " File explorer
      Plug 'scrooloose/nerdtree'

      " Undo tree
      Plug 'mbbill/undotree'
      
      " TagBar
      Plug 'majutsushi/tagbar'

      " see the keymaps
      Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

    "
    " }


    " allowing unix command (with capital) in vim
    Plug 'tpope/vim-eunuch'

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
    Plug 'junegunn/vim-easy-align'

    " Snips -- use SnipMate for snip engine
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'garbas/vim-snipmate'
    Plug 'honza/vim-snippets'

	" }


	" Languages {
    " Plugs for language support
	  Plug 'sheerun/vim-polyglot'

    " R plugins {
	        " Turn vim into R IDE
          Plug 'jalvesaq/Nvim-R' 
      " }
      
      " HTML plugins {
      " Auto tag completion by sparkup <c-e>,
      Plug 'rstacruz/sparkup'

      " Open a browser to preview markdown files
			function! BuildComposer(info)
				if a:info.status != 'unchanged' || a:info.force
					if has('nvim')
						!cargo build --release
					else
						!cargo build --release --no-default-features --features json-rpc
					endif
				endif
			endfunction

			Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

      " easily surround stuff
      Plug 'tpope/vim-surround'
      " }
      
      " Python plugins {
      " construct python IDE by python-mode
      Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }

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

    " set the appearance of the cursor line
    g:set cursorline

      " airline {
      " airline theme
      let g:airline_theme='light'

      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#left_sep = ' '
      let g:airline#extensions#tabline#left_alt_sep = '|'
      let g:airline_powerline_fonts = 0
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
     " }

      " IndentLines {
      " Turn on IndentLines when started
      autocmd vimenter * IndentLines
      " }

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

    " Undo tree {
        if has("persistent_undo")
            set undodir=~/.undodir/
            set undofile
        endif
    " }

    " indentLine {
       set expandtab
       set tabstop=2
       set shiftwidth=2

       "let g:indentLine_color_term = 239
       let g:indentLine_char = '¦'
    " }

    set cursorline                  " highlight current line

    " hi CursorLine guibg=#ffffff     " highlight bg color of current line
    " hi CursorColumn guibg=#333333   " highlight cursor
    " hi TermCursor ctermfg=red       " TODO: Fixthis
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
            " Let fzf start from the root
              function! s:find_home()
                return system('~')
              endfunction

              command! ProjectFiles execute 'Files' s:find_home()
        "}

        "ALE {
              " allow hovering the lint
              let g:ale_set_balloons=1
        "}
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
        noremap <S-l> <C-w>l
        noremap <S-h> <C-w>h
        noremap <S-j> <C-w>j
        noremap <S-k> <C-w>k
        nnoremap <C-H> gT
        nnoremap <C-L> gt


        "Map Ctrl + S to save in any mode
        nnoremap <C-s> :update<CR>
        vnoremap <C-s> :<esc>update<CR>
        inoremap <C-s> :<esc>update<CR>

        " Quickly close windows
        nnoremap <C-x> :x<cr>
        " nnoremap <leader>X :q!<cr>

        " resize panes
        nnoremap - :<esc><C-w>-
        nnoremap + :<esc><C-w>+
        nnoremap ( :<esc><C-w>>
        nnoremap ) :<esc><C-w><

        " Use tab to jump between blocks, because it's easier
        nnoremap <tab> %
        vnoremap <tab> %

        " press <f7> to fix the indentation
        map <F7> mzgg=G`z

    " }

        " Plugin Keymaps {
        "
        " functional extention {

            " all uses leader key , + plugin initials 
            " NerdTree {
                " Toggle NerdTree by bunching Ctrl+t
                nnoremap ,n :NERDTreeToggle<CR>
            "}

            " Undo Tree {
                " Use C-u to toggle the undo tree
                nnoremap ,u :UndotreeToggle<cr>
            " }

            " Tagbar {
                " Toggle tagbar
                nnoremap ,t :TagbarToggle<cr>
            "}

            " fzf {
                " invoking fzf
                map ,f :Files ~<CR>
            " }

          "
        " }

            " easymotion {

                nmap <silent>f <Plug>(easymotion-bd-w)
            " }

            " incsearch {
                map /  <Plug>(incsearch-forward)
                map ?  <Plug>(incsearch-backward)
                map g/ <Plug>(incsearch-stay)
                " :h g:incsearch#auto_nohlsearch
                " set hlsearch
                let g:incsearch#auto_nohlsearch = 1
                map n  <Plug>(incsearch-nohl-n)
                map N  <Plug>(incsearch-nohl-N)
                map *  <Plug>(incsearch-nohl-*)
                map #  <Plug>(incsearch-nohl-#)
                map g* <Plug>(incsearch-nohl-g*)
                map g# <Plug>(incsearch-nohl-g#)
            " }
            "
            " incsearch-ezmotion {
                
                map z/ <Plug>(incsearch-easymotion-/)
                map z? <Plug>(incsearch-easymotion-?)
                map zg/ <Plug>(incsearch-easymotion-stay)
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

            " SwapWindow {
                let g:windowswap_map_keys = 0 "prevent default bindings
                nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
                nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
                nnoremap <silent> <leader>sw :call WindowSwap#EasyWindowSwap()<CR>
            " }

            " vimwiki {
                " Change syntax to markdown
                let g:vimwiki_list = [{'path': '~/vimwiki/',
                                       \ 'syntax': 'markdown', 'ext': '.md'}]
                
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

""" File Typle Config {
autocmd BufEnter *.md :setlocal filetype=markdown
"""}

