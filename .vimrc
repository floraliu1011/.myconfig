" Modeline and Notes {
" " vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" " }

" General Init {
 set number
 syntax on
 set colorcolumn=90
 set history=100
 filetype indent on
 set nowrap
 set tabstop=2
 set shiftwidth=2
 set expandtab
 set smartindent
 set autoindent
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
	  " fuzzy search with fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " airline at the bottom
    Plug 'vim-airline/vim-airline'  

    " airline themes 
    Plug 'vim-airline/vim-airline-themes'

    " allowing unix command (with capital) in vim 
    Plug 'tpope/vim-eunuch'

    " Vertical line to show vertical alignment and identation
    Plug 'Yffdroot/indentLine'

    " File explorer
    Plug 'scrooloose/nerdtree'

    " Turn vim into excel
    Plug 'chrisbra/csv.vim'

    " Tmux status line
    Plug 'edkolev/tmuxline.vim'

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
    
    " highlight trailing whitespace (remove by :FixWhitespace
    Plug 'bronson/vim-trailing-whitespace'

    " autocomplete brackets
    Plug 'Raimondi/delimitMate'

    " block comment 
    Plug 'tpope/vim-commentary'

    " autocomplete prompt
    Plug 'vim-scripts/AutoComplPop'

	" }
  

	" Languages {
    " Plugins for language support
	  Plug 'sheerun/vim-polyglot'

    " R plugins {
	        " Turn vim into R IDE
          Plug 'jalvesaq/Nvim-R'

          " auto completion for R
          " Plug 'roxma/nvim-completion-manager'
          " Plug 'gaalcaras/ncm-R'

          " Optional: for snippet support
          Plug 'sirver/UltiSnips'
          "
          "
      " }
      "
      " HTML plugins {
      " Auto tag completion by emmet <c-y>,
      Plug 'mattn/emmet-vim'
      " }
	" }
  "
	
  " Initialize plugin system
	call plug#end()
" }

" User Interface {
      
      " airline {
      let g:airline_theme='light'

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
    
    " indentLine {
        " choose indent character
        let g:indentLine_char = '¦'

    " }    

    "" set cursorline                  " highlight current line

    hi CursorLine guibg=#ffffff     " highlight bg color of current line
    hi CursorColumn guibg=#333333   " highlight cursor
    hi TermCursor ctermfg=red       " TODO: Fixthis
" }
"
" Keymaps {
    
    " Basic keymaps {
    
    " Keymaps for daily usage

    " ,y and ,p allow copy and paste between different vim sessions
    vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
    nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
    map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
    map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

   
    " }
    "
    " Plugin Keymaps {
        
        " fzf {
            " invoking fzf
            map ; :Files<CR>
        " }
        
        " Nvim-R {
        " Mapping , and ,e to send one line to R session
        " remapping the basic :: send line
        nmap , <Plug>RDSendLine
        " " remapping selection :: send multiple lines
        vmap , <Plug>RDSendSelection
        " " remapping selection :: send multiple lines + echo lines
        vmap ,e <Plug>RESendSelection
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
    " }
" }
"
" Plugin configuration {
        " NERDTree {
        " always show dot files in
        let NERDTreeShowHidden=1
        " }
" }
