" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

"Ensure correct colors
"set termguicolors

"VimPlug
call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'hobbestigrou/vimtips-fortune'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'


"Syntax highlighters
Plug 'quabug/vim-gdscript'

"Colorschemes
Plug 'jacoborus/tender.vim'
Plug 'fmoralesc/molokayo'
Plug 'chriskempson/base16-vim'

" Better Markdown support
Plug 'plasticboy/vim-markdown'

call plug#end()

"""""""""""""""
" VIM FORTUNE "
"""""""""""""""
let g:fortune_vimtips_display_in_window=0

"""""""""""
" AIRLINE "
"""""""""""
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', ':%3v'])


"""""""""""""""""""""
" EASYMOTION CONFIG "
"""""""""""""""""""""
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion



"""""""""""""""""""""""
"DEOPLETE
""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" use tab to backward cycle
"inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

"""""""""""""""""""""""
" NETRW LOOK AND FEEL "
"""""""""""""""""""""""
"How <CR> opens a new file
let g:netrw_browse_split = 0
"Change from left splitting to right splitting
let g:netrw_altv = 1
"Style the the list is presented in, 3 = tree style
let g:netrw_liststyle = 3
"Size expressed in percentage
let g:netrw_winsize = 50
"True/False, enables or disables banner
let g:netrw_banner = 1

"""""""""""""
" FUNCTIONS "
"""""""""""""
function! AskForConfirmationSave() abort
	let l:choice = input('Save Session? [Y/N]')
	" ==? is case insensitive
	if l:choice ==? 'Y'
		execute ':mksession! ./vimSession.vim'
	else
		return
	endif
endfunction

function! AskForConfirmationLoad() abort
	let l:choice = input('Load Session? [Y/N]')
	" ==? is case insensitive
	if l:choice ==? 'Y'
		execute ':source ./vimSession.vim'
	else
		return
	endif
endfunction

""""""""""
"GENERAL "
""""""""""
" Show Absolute Line Numbers
:set number

" Favorite colors
":color desert256
":color molokaiCustom

" Set tab character to appear 4 spaces wide
set tabstop=4
" Set an indent width to 4 to correspond to a single tab
set shiftwidth=4

set encoding=utf8
syntax on
" Map space to leader 
map <SPACE> \
map <SPACE><SPACE> \\
" timeoutlen is used for mapping delays, ttimeoutlen is used for key code delays
set timeoutlen=500 ttimeoutlen=10

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)





"""""""""""""""""""""""
"Function Key Mappings"
"""""""""""""""""""""""
"assign netrw mapping
nnoremap <F2> :<C-U>Vexplore <CR>
nnoremap <F3> :<C-U>Sexplore <CR>

"Session saving and loading
nnoremap <F5> :<C-U>call AskForConfirmationSave()<CR>
nnoremap <F6> :<C-U>call AskForConfirmationLoad()<CR>

"Fortune
nnoremap <F7> :<C-U>Fortune<CR>

"<F11> Mapped to fullscreen

"map highlight search toggle
nnoremap <F12> :<C-U>set hlsearch!<CR>

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Transparent BG
" hi Normal guibg=NONE ctermbg=NONE
