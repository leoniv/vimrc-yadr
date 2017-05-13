"********************* Apprearance *********************************************
" Srting wrapping
set wrap
set linebreak
set textwidth=80

if exists('+colorcolumn')
  set colorcolumn=+1
endif

" Show hidden char
set listchars=tab:▸\ ,eol:¬,precedes:«,extends:»,trail:␣
set showbreak=↪

" Only shown when not in insert mode so I don't go insane.
augroup trailing
  au!
  au InsertEnter * :set listchars-=trail:␣
  au InsertLeave * :set listchars+=trail:␣
augroup END
" Remove trailing whitespaces when saving
" Wanna know more? http://vim.wikia.com/wiki/Remove_unwanted_spaces
" If you want to remove trailing spaces when you want, so not automatically,
" see
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Display_or_remove_unwanted_whitespace_with_a_script.
autocmd BufWritePre * :%s/\s\+$//e

"***************************** Searching ***************************************
nnoremap / /\v
vnoremap / /\v
" Searching Don't jump when using * && # for search
nnoremap * *<c-o>
nnoremap # *<c-o>

"******************** Navigation && Windows ************************************

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Bubbling lines
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Resize windows with arrow keys
nnoremap <A-Up> <C-w>+
nnoremap <A-Down> <C-w>-
nnoremap <A-Left> <C-w><
nnoremap <A-Right> <C-w>>

"************************** Folding ********************************************

set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=6

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za
" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO
" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

function! MyFoldText() " {{{
  let line = getline(v:foldstart)
  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart
  " expand tabs into spaces
  let onetab = strpart(' ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')
  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}

set foldtext=MyFoldText()

"************************* ColorScheme *****************************************

colorscheme solarized
set background=dark
let g:solarized_termcolors=256
let g:solarized_contrast="low"
let g:solarized_visibility="low"
call togglebg#map("<F5>")

"************************* Plugins *********************************************
" NERDTree
nmap <Tab> :NERDTreeToggle <CR>

"************************ Localization *****************************************
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

"*********************** Spelling **********************************************

"setlocal spell spelllang=ru_yo,en_us
set wildmenu
set wcm=<Tab>
" проверка орфографии:
menu SetSpell.on  :setlocal spl=ru_yo,en_us spell<CR>
menu SetSpell.off :setlocal nospell<CR>
map <F7> :emenu SetSpell.<Tab>
" выбор альтернатив:
map <F8> z=<CR>
map <F5> ]s
map <S-F5> [s
map <F9> zG
map <S-F9> zuG

"********************** asciidoc ***********************************************
Plugin 'mjakl/vim-asciidoc'
