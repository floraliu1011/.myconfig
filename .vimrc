" Modeline and Notes {
" " vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" " }
"

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
	"
	" }
	" Languages {
	" Plugins for language support
	Plug 'jalvesaq/Nvim-R'
	" }
	" Initialize plugin system
	call plug#end()
" }
