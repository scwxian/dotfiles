set nocompatible
filetype plugin indent on
syntax on
set nobackup
set noswapfile
set autoread
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set scrolloff=999
set foldmethod=indent
set foldlevel=99
set foldcolumn=2
set virtualedit=block
set regexpengine=0



" COLOR AND LOOK  ---------------------------------------------------------------- {{{
colorscheme chalk
set encoding=utf-8
set number
set cursorline
set shiftwidth=4
set tabstop=4
set expandtab
set signcolumn=auto
hi SignColumn guibg=Grey15 ctermbg=235
hi LineNr guifg=Grey37 guibg=Grey15 ctermfg=59 ctermbg=235
hi CursorLineNr guifg=DarkSeaGreen guibg=Grey23 gui=bold ctermfg=108 ctermbg=237
hi Folded guifg=#808080 guibg=#3a594b
hi FoldColumn guibg=#262626 guifg=#6c6c6c
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"
let &t_EI = "\<Esc>[2 q"
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
" }}}

" PLUGINS ---------------------------------------------------------------- {{{
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Language and Coding
  Plug 'dense-analysis/ale'
  Plug 'sheerun/vim-polyglot'
  Plug 'rhysd/vim-lsp-ale'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

" Visual QoL
  Plug 'machakann/vim-highlightedyank'
  Plug 'ap/vim-css-color'
  Plug 'itchyny/vim-cursorword'
  Plug 'bounceme/poppy.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'romainl/vim-cool'

" Practical QoL like Text Navigation and Editing
  Plug 'bkad/CamelCaseMotion'
  Plug 'mbbill/undotree'
  Plug 'rhysd/clever-f.vim'
  Plug 't9md/vim-textmanip'
  Plug 'zef/vim-cycle'
  Plug 'markonm/traces.vim'
  Plug 'tpope/vim-commentary'
  Plug 'machakann/vim-sandwich'
  Plug 'tmsvg/pear-tree'
  Plug 'mg979/vim-visual-multi'
  Plug 'maxbrunsfeld/vim-yankstack'
  Plug 'svermeulen/vim-subversive'
  Plug 'romainl/vim-qf'
  Plug 'kshenoy/vim-signature'
  Plug 'AndrewRadev/splitjoin.vim'


" Other Add-on Features
  Plug '/opt/homebrew/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'rhysd/vim-healthcheck'
  Plug 'tpope/vim-eunuch'
  Plug 'girishji/vimsuggest'
  Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}

call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{
call yankstack#setup()
nnoremap <SPACE> <Nop>
nnoremap <C-z> <Nop>
nnoremap s <Nop>| "Remove Select operator
nnoremap S <Nop>| "Remove Select operator
nnoremap Q <Nop>| "Remo
let mapleader=" "
nnoremap <leader> :

    " Cursor Movement for Normal and Visual Mode
noremap <Esc>f <Plug>CamelCaseMotion_w| " alt+right behaves like Mac text cursor
noremap <Esc>b <Plug>CamelCaseMotion_b| " alt+left behaves like Mac text cursor
noremap <Esc>[1;3A {| " alt+up jumps paragraph
noremap <Esc>[1;3B }| " alt+down jumps paragraph
noremap <Esc>[1;9A <C-u>| " cmd+up jumps up half a page
noremap <Esc>[1;9B <C-d>| " cmd+down jumps down half a page
noremap <Up> g<Up>| " move up single line even on wrapped lines
noremap <Down> g<Down>|  " move down single line even on wrapped lines
noremap <M-BS> daw|  "alt+backspace deletes by word
noremap <silent> U :UndotreeToggle<CR>|  "toggle undotree window
noremap <silent> u :earlier<CR>|  " undo with undotree compatibility
noremap <Esc>[122;10u :later<CR>|  " redo with undotree compatibility
noremap <Esc>[1;11A <Plug>(textmanip-move-up)|  " move line up
noremap <Esc>[1;11B <Plug>(textmanip-move-down)|  " move line down
noremap <Esc>[1;11C <Plug>(textmanip-move-right)|  " move line right
noremap <Esc>[1;11D <Plug>(textmanip-move-left)|  " move line left

    " Cursor Movement for Insert Mode
inoremap <silent> <Esc>f <C-o><Plug>CamelCaseMotion_w| " alt+right behaves like Mac text cursor
inoremap <silent> <Esc>b <C-o><Plug>CamelCaseMotion_b| " alt+left behaves like Mac text cursor
inoremap <silent> <Esc>[1;3A <C-o>{| " alt+up behaves like Mac text cursor
inoremap <silent> <Esc>[1;3B <C-o>}| " alt+down behaves like Mac text cursor
inoremap <M-BS> <C-W>|  "alt+backspace deletes by word
inoremap <C-Up> <C-o>g<Up>| " move up single line even on wrapped lines
inoremap <C-Down> <C-o>g<Down>|  " move down single line even on wrapped lines

    " Yank cycling with yank-stack
nmap ð <Plug>yankstack_substitute_newer_paste| "Cmd+p to cycle yank stack
xmap ð <Plug>yankstack_substitute_newer_paste| "Cmd+p to cycle yank stack
imap ð <Plug>yankstack_substitute_newer_paste| "Cmd+p to cycle yank stack
nmap P <Plug>yankstack_substitute_older_paste| "Shift+p to cycle yank stack
xmap P <Plug>yankstack_substitute_older_paste| "Shift+p to cycle yank stack
nmap Ð :IPaste<CR>| "Shift+Cmd to open Interactive Paste Window
xmap Ð :IPaste<CR>| "Shift+Cmd to open Interactive Paste Window
imap Ð <C-o>:IPaste<CR>| "Shift+Cmd to open Interactive Paste Window

    " FZF Keymaps
nnoremap <C-t> :Files<CR>| " search files
nnoremap <C-r> :History:<CR>| " search ex cmds
nnoremap <leader>so :FzfxBuffers<CR>| " search buffer - special window to allow ctrl+d to delete buffers
nnoremap <leader>sf :Files<CR>| " search files with rg
nnoremap <leader>sl :Rg<CR>| " search for existing lines in files open in buffer via rg
nnoremap <leader>sh :History<CR>| " reveal previously opened files
nnoremap <leader>s/ :History/<CR>| " reveal previous search terms
nnoremap <leader>sm :GlobalMarks<CR>| " reveal global marks only
nnoremap <leader>sk :CustomKeys<CR>!^<P | " reveal all custom key bindings
nnoremap m? :BMarks<CR>| " reveal local marks only
nnoremap m— :Marks<CR>| " reveal all marks
nnoremap mdd :delmarks!<CR>| "delete all lowercase marks

   "vim-signature and markers
nnoremap , '| " Change marker moving shortcut
nnoremap ,, ''| " Change marker moving shortcut
let g:SignatureMap = {
  \ 'Leader'             :  "m",
  \ 'PlaceNextMark'      :  "",
  \ 'ToggleMarkAtLine'   :  "m,",
  \ 'PurgeMarksAtLine'   :  "",
  \ 'DeleteMark'         :  "",
  \ 'PurgeMarks'         :  "mda",
  \ 'PurgeMarkers'       :  "mdm",
  \ 'GotoNextLineAlpha'  :  "",
  \ 'GotoPrevLineAlpha'  :  "",
  \ 'GotoNextSpotAlpha'  :  "",
  \ 'GotoPrevSpotAlpha'  :  "",
  \ 'GotoNextLineByPos'  :  "*<Down>",
  \ 'GotoPrevLineByPos'  :  "*<Up>",
  \ 'GotoNextSpotByPos'  :  "",
  \ 'GotoPrevSpotByPos'  :  "",
  \ 'GotoNextMarker'     :  "*<Right>",
  \ 'GotoPrevMarker'     :  "*<Left>",
  \ 'GotoNextMarkerAny'  :  "",
  \ 'GotoPrevMarkerAny'  :  "",
  \ 'ListBufferMarks'    :  "",
  \ 'ListBufferMarkers'  :  "m/"
  \ }

  " vsip
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'| " Tab to jump between variables in snippet
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'| " Tab to jump between variables in snippet
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'| " Shift+Tab to jump back between variables in snippet
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'| " Shift+Tab to jump back between variables in snippet
nmap <Esc>[120;9u <Plug>(vsnip-cut-text)| " Use actual Cut key to register to $TM_SELECTED_TEXT
xmap <Esc>[120;9u <Plug>(vsnip-cut-text)| " Use actual Cut key to register to $TM_SELECTED_TEXT

  " vim-lsp keymaps
nnoremap <silent> <buffer> <leader>js <plug>(lsp-workspace-symbol)
nnoremap <silent> <buffer> <leader>jr <plug>(lsp-rename)
nnoremap <silent> <buffer> <leader>jn <plug>(lsp-next-diagnostic)
nnoremap <silent> <buffer> <leader>jp <plug>(lsp-previous-diagnostic)
nnoremap <silent> <buffer> <leader>jh <plug>(lsp-hover-float)
nnoremap <silent> <buffer> <leader>jt <plug>(lsp-peek-type-definition)
nnoremap <silent> <buffer> <leader>ji <plug>(lsp-peek-implementation)
nnoremap <silent> <buffer> <leader>jd <plug>(lsp-peek-definition)
nnoremap <silent> <buffer> <leader>ja <plug>(lsp-code-action-float)
nnoremap <silent> <buffer> <S-Up> :call lsp#scroll(-4)<CR>| "Shift+Up to scroll definition or hover
nnoremap <silent> <buffer> <S-Down> :call lsp#scroll(+4)<CR>| "Shift+Down to scroll definition or hover

   " quickfix/location list
nnoremap <leader>cc <Plug>(qf_qf_toggle)| " Toggle open quickfix window
nnoremap <leader>ll <Plug>(qf_loc_toggle)| " Toggle open location window
nnoremap ~ <C-W><C-W>| " Cycle between open windows

   " Vim-gitgutter
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)
nmap <leader>hd <Plug>(GitGutterPrevHunk)
nmap <leader>ht <Plug>(GitGutterNextHunk)
nmap <leader>gg :GitGutterSignsToggle<CR>
nmap <leader>gd :GitGutterDiffOrig<CR>


   " Others or QoL
noremap <leader>y "+y| " Yank to clipboard, similar to cmd+c
noremap <leader>p "+p| " Paste from clipboard, similar to cmd+v
noremap <leader>d "_d| " Delete without yanking to register
noremap <leader>D "_D| " Delete without yanking to register
noremap <leader>c "_c| " Change without yanking to register
noremap <leader>C "_C| " Change without yanking to register
noremap x "_x| " Delete without yanking to register
noremap Y y$| " Yank to end of line
nmap <leader>s <plug>(SubversiveSubstitute)
nmap <leader>ss <plug>(SubversiveSubstituteLine)
nmap <leader>S <plug>(SubversiveSubstituteToEndOfLine)
noremap <leader>ww :w<CR>| " Quick Save
noremap <leader>qq :q<CR>| " Quick Exit if no edits are done, great for read-only files and prevents accidetal exits if changes were made
noremap <leader>wq :wq<CR>| " Quick Save and quit
noremap <leader><Esc>[1;11A <Plug>(textmanip-duplicate-up)|  " duplicate line up
noremap <leader><Esc>[1;11B <Plug>(textmanip-duplicate-down)|  " duplicate line down
noremap <S-Enter> <Plug>(textmanip-blank-above)<Up>| " Add line to top and move cursor
noremap <Enter> <Plug>(textmanip-blank-below)<Down>| " Add line to bottom and move cursor


" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Minor Opts for Small Plugins
" vim-highlightedyank
let g:highlightedyank_highlight_duration = 100
highlight HighlightedyankRegion cterm=reverse gui=reverse

" vim-cool
let g:cool_total_matches = 1

" For FZF
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,70%,']

let s:default_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }
function! s:action_for(key, ...)
    let default = a:0 ? a:1 : ''
    let Cmd = get(get(g:, 'fzf_action', s:default_action), a:key, default)
    return type(Cmd) == s:TYPE.string ? Cmd : default
endfunction

function! s:find_open_window(b)
    let [tcur, tcnt] = [tabpagenr() - 1, tabpagenr('$')]
    for toff in range(0, tabpagenr('$') - 1)
        let t = (tcur + toff) % tcnt + 1
        let buffers = tabpagebuflist(t)
        for w in range(1, len(buffers))
            let b = buffers[w - 1]
            if b == a:b
                return [t, w]
            endif
        endfor
    endfor
    return [0, 0]
endfunction

function! s:jump(t, w)
    execute a:t.'tabnext'
    execute a:w.'wincmd w'
endfunction

function! s:buffers_sink(lines, query, fullscreen)
    if len(a:lines) < 3
        return
    endif
    let b = matchstr(a:lines[2], '\[\zs[0-9]*\ze\]')
    let bufname=split(a:lines[2])[-1]
    let action = a:lines[1]
    if empty(action)
        let [t, w] = s:find_open_window(b)
        if t
            call s:jump(t, w)
            return
        endif
        execute 'buffer' b
        return
    endif
    if action==?'ctrl-d'
        execute 'bdelete' b
        call s:custom_buffer(a:query, a:fullscreen)
    else
        let cmd = s:action_for(action)
        if !empty(cmd)
            execute 'silent' cmd
        endif
        execute 'buffer' b
    endif
endfunction

function! s:custom_buffer(query, fullscreen)
    let spec = { 'sink*': {lines -> s:buffers_sink(lines, a:query, a:fullscreen)},
                \ 'options': [
                \   '--print-query',
                \   '--prompt', 'Buffer> '
                \ ],
                \ 'placeholder': '{1}'
                \ }
    let spec._action = get(g:, 'fzf_action', s:default_action)
    call add(spec.options, '--expect=ctrl-d,'.join(keys(spec._action), ','))
    call fzf#vim#buffers(a:query, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -bar -bang -nargs=? -complete=dir FzfxBuffers call s:custom_buffer(<q-args>, <bang>0)| " Custom Buffer Search with Delete Feature
command! -bang GlobalMarks call fzf#vim#marks('ABCDEFGHIJKLMNOPQRSTUVWXYZ', {'options': ['--layout=reverse-list', '--info=inline']})| " Custom Global Marks only search
command! -bang CustomKeys call fzf#vim#maps('', {'options': ['--layout=reverse-list', '--info=inline']})| " Custom Global Marks only search

" For Poppy
augroup Poppy
    autocmd!
    autocmd CursorMoved * call PoppyInit()
augroup end

hi PoppyLevel1 guibg=#5faf87 guifg=#262626 gui=bold
hi PoppyLevel2 guibg=#5f87af guifg=#262626 gui=bold
hi PoppyLevel3 guibg=#d7875f guifg=#262626 gui=bold
hi PoppyLevel4 guibg=#af5f5f guifg=#262626 gui=bold
hi PoppyLevel5 guibg=#87afd7 guifg=#262626 gui=bold
hi PoppyLevel6 guibg=#af8787 guifg=#262626 gui=bold

let g:poppyhigh = ['PoppyLevel1', 'PoppyLevel2', 'PoppyLevel3', 'PoppyLevel4', 'PoppyLevel5', 'PoppyLevel6']

" Trigger Limelight only on Insert mde
augroup trigger_limelight
  autocmd!
  autocmd InsertEnter * Limelight
  autocmd InsertLeave * Limelight!
augroup END

let g:limelight_paragraph_span = 2

" Undotree and Persistent Undo
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_ShortIndicators = 1
let g:undotree_SplitWidth = 22
let g:undotree_HelpLine = 0

augroup closeUndotreeOnFileExit
    autocmd!
    autocmd BufWritePost * call undotree#UndotreeHide()
augroup end

if has("persistent_undo")
   let target_path = expand('~/.vim/.undodir')

    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

" Clever-f
let g:clever_f_smart_case = 1
let g:clever_f_mark_direct = 1

" ALE Configs
let g:ale_fixers = {
\   'go': ['goimports', 'gofmt'],
\   'sh': ['shfmt'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'c': ['clang-format'],
\   'ansible': ['ansible-lint'],
\   'yaml': ['yamlfix', 'yamlfmt'],
\   '*': ['trim_whitespace', 'remove_trailing_lines'],
\}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_disable_lsp = 1
let g:ale_set_signs = 1
let g:ale_set_highlights = 1
let g:ale_echo_cursor = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_virtualtext_prefix = '[%linter%] %code: %   '
let g:ale_virtualtext_delay = 100
let g:ale_sign_error = ' '
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = 'ℹ'

hi Error term=undercurl cterm=undercurl gui=undercurl ctermbg=167 guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE guisp=IndianRed1
hi SpellBad term=undercurl cterm=undercurl gui=undercurl ctermbg=167 guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE guisp=#d7875f
hi SpellCap term=undercurl cterm=undercurl gui=undercurl ctermbg=167 guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE guisp=blue

hi link ALEError Error
hi ALEErrorSign guibg=NONE guifg=IndianRed1 gui=bold
hi ALEVirtualTextError guifg=#914444 guibg=#302a2a

hi link ALEWarning SpellBad
hi ALEVirtualTextWarning guifg=#ad9700 guibg=#383425
hi ALEWarningSign guibg=NONE guifg=LightGoldenrod3 gui=bold

hi link ALEInfo SpellCap
hi ALEVirtualTextInfo guifg=#5c82ab guibg=#2f3642
hi ALEInfoSign guibg=NONE guifg=LightSkyBlue3 gui=bold


" vim-lsp Configs
let g:lsp_semantic_enabled = 1
let g:lsp_fold_enabled = 0
function! s:on_lsp_buffer_enabled() abort
    sign define LspHint text= texthl=LspHintSign
    sign define LspCodeAction text=  texthl=LspCodeActionSign
    setlocal omnifunc=lsp#complete
        setlocal signcolumn=auto
endfunction

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
        \ 'allowlist': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
        \ })
endif

    augroup lsp_install
        au!
        autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    augroup END

" asyncomplete menu settings
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"
highlight Pmenu guibg=#202020 guifg=#C0C0C0
highlight PmenuSel guibg=#4a8f6d guifg=#080808 gui=bold
highlight PmenuSbar guibg=#303030
highlight PmenuThumb guibg=#7baf98
highlight PmenuMatch guibg=NONE guifg=#7baf98

let g:lsp_kind_icons = {
\   'text':          '',
\   'method':        '',
\   'function':      'ƒ',
\   'constructor':   '',
\   'field':         '󰘎',
\   'variable':      '',
\   'class':         '󱏒',
\   'interface':     '',
\   'module':        '',
\   'property':      '',
\   'unit':          '',
\   'value':         '',
\   'enum':          '',
\   'keyword':       '',
\   'snippet':       '󰆐',
\   'color':         '',
\   'file':          '',
\   'reference':     '',
\   'folder':        '',
\   'enummember':    '',
\   'constant':      '',
\   'struct':        '',
\   'event':         '',
\   'operator':      'ﬦ',
\   'typeparameter': '󰰤',
\ }


function! IconPreprocessor(options, matches)
    if type(a:matches) != type({})
        call asyncomplete#preprocess_complete(a:options, [])
        return
    endif

    let l:final_items = []

    for [l:source_name, l:match_data] in items(a:matches)
        if type(get(l:match_data, 'items', 0)) != type([])
            continue
        endif

        let l:base_text = a:options.typed[l:match_data.startcol - 1:]

        for l:item in l:match_data.items
            if type(l:item) == type({}) && stridx(l:item.word, l:base_text) == 0
                if has_key(l:item, 'kind')
                    let l:icon = get(g:lsp_kind_icons, tolower(l:item.kind), '')
                    let l:item.abbr = printf('%s  %s', l:icon, l:item.word)
                endif
                call add(l:final_items, l:item)
            endif
        endfor
    endfor

    if !empty(l:final_items)
        call asyncomplete#preprocess_complete(a:options, l:final_items)
    endif

endfunction

let g:asyncomplete_preprocessor = [function('IconPreprocessor')]

" For Pear Tree
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ "'": {'closer': "'"},
            \ '"': {'closer': '"'},
            \ '<': {'closer': '>'}
            \ }

"For Yanking
 let g:yankstack_map_keys = 0

" Custom Function for Interactive Paste
" inspired by vim-easyclip, adapted for yank-stack
command! -nargs=0 IPaste call s:InteractivePaste()

function! s:GetDefaultRegister()
  let clipboard_flags = split(&clipboard, ',')
  if index(clipboard_flags, 'unnamedplus') >= 0
    return "+"
  elseif index(clipboard_flags, 'unnamed') >= 0
    return "*"
  else
    return "\""
  endif
endfunction

function! s:InteractivePaste()
  if !exists('*g:Yankstack')
    echohl ErrorMsg | echo "vim-yankstack plugin not found or g:Yankstack() is not available." | echohl None
    return
  endif

  let yanks = g:Yankstack()
  if empty(yanks)
    echohl WarningMsg | echo "Yank history is empty." | echohl None
    return
  endif

 echohl WarningMsg | echo "--- Interactive Paste ---" | echohl None
  let i = 0
  for yank in yanks
    let index_text = printf("%-4d", i)
    let lines = split(yank.text, '\n')
    let first_line = get(lines, 0, '')
    let no_tabs_line = substitute(first_line, '\t', repeat(' ', &tabstop), 'g')
    let clean_line = substitute(no_tabs_line, '^\s\+', '', '')
    let max_len = winwidth(0) - 10
    let truncated_line = clean_line

    if len(clean_line) > max_len || len(lines) > 1
        let truncated_line = strpart(clean_line, 0, max_len) . '…'
    endif

    echohl Directory   | echo index_text
    echohl None        | echon truncated_line
    echohl None

    let i += 1
  endfor

  let num_yanks = len(yanks)
  let index_num = ''

  echohl Question | echo "Input index (Press any other key to quit): " | echohl None

  if num_yanks > 9

    while 1
      let char_code = getchar()
      let char = (type(char_code) == type(0)) ? nr2char(char_code) : char_code

      if char =~ '\d'
        let index_num .= char
        echon char
        if len(index_num) == 2 | break | endif
      elseif char == "\<CR>" || char == "\<Enter>"
        break
      else
        let index_num = ''
        break
      endif
    endwhile

  else

    let char_code = getchar()
    let char = (type(char_code) == type(0)) ? nr2char(char_code) : char_code

    if char =~ '\d'
      let index_num = char
    endif

  endif

  redraw!

  if empty(index_num)
    return
  endif

  let index = str2nr(index_num)
  if index < 0 || index >= num_yanks
    echohl ErrorMsg | echo "Yank index out of bounds." | echohl None
    return
  endif

  let chosen_yank = yanks[index]
  call setreg(s:GetDefaultRegister(), chosen_yank.text, chosen_yank.type)

  try
    normal! p
  catch
    echohl ErrorMsg | echo "Error during paste. Is the register valid?" | echohl None
  endtry

endfunction

" Vim-signature Markers
let g:SignatureMarkOrder="\m󰫢"
let g:SignatureMarkTextHL = "Identifier"
let g:SignatureMarkerTextHL = "Identifier"

" Vim-qf / Quickfix & Location Lists
augroup QF_LocationList_Mappings
    autocmd!
    autocmd FileType qf nnoremap <silent> <buffer> <Left> <Plug>(qf_older)
    autocmd FileType qf nnoremap <silent> <buffer> <Right> <Plug>(qf_newer)
    autocmd FileType qf nnoremap <silent> <buffer> <Up> :call AutoListTypePrev()<CR>
    autocmd FileType qf nnoremap <silent> <buffer> <Down> :call AutoListTypeNext()<CR>
augroup END

let g:qf_shorten_path = 3

function! AutoListTypeNext()
    if !empty(getloclist(0))
      execute "normal! \<Plug>(qf_loc_next)"
    elseif !empty(getqflist())
      execute "normal! \<Plug>(qf_qf_next)"
    endif
endfunction

function! AutoListTypePrev()
    if !empty(getloclist(0))
      execute "normal! \<Plug>(qf_loc_previous)"
    elseif !empty(getqflist())
      execute "normal! \<Plug>(qf_qf_previous)"
    endif
endfunction

" vim-suggest

    let g:VimSuggest = get(g:, 'VimSuggest', {})
    let g:VimSuggest.cmd = get(g:VimSuggest, 'cmd', {
        \ 'enable': v:true,
        \ 'pum': v:true,
        \ 'exclude': [
            \ '^\s*\d*\s*b\%[uffer]!\?\s\+',
            \ '^\s*\d*\s*sb\%[uffer]!\?\s\+'
            \],
        \ 'onspace': ['b\%[uffer]','colo\%[rscheme]'],
        \ 'alwayson': v:true,
        \ 'popupattrs': {
            \ 'borderchars': ['─', '│', '─', '│', '┌', ' ', '┘', '└'],
            \ 'borderhighlight': ['Normal'],
            \ 'highlight': 'Normal',
            \ 'border': [1, 1, 1, 1],
            \ 'padding': [0, 1, 0, 1],
            \ 'maxheight': 20,
            \ },
        \ 'wildignore': v:true,
        \ 'addons': v:false,
        \ 'trigger': 'n',
        \ 'reverse': v:true,
    \ })

  let g:VimSuggest.search = get(g:VimSuggest, 'search',{
      \ 'enable': v:true,
      \ 'pum': v:true,
      \ 'fuzzy': v:true,
      \ 'alwayson': v:true,
      \ 'popupattrs': {
          \ 'borderchars': ['─', '│', '─', '│', '┌', ' ', '┘', '└'],
          \ 'borderhighlight': ['Normal'],
          \ 'highlight': 'Normal',
          \ 'border': [1, 1, 1, 1],
          \ 'padding': [0, 1, 0, 1],
          \ 'maxheight': 20,
          \ },
      \ 'range': 100,
      \ 'timeout': 200,
      \ 'async': v:true,
      \ 'async_timeout': 3000,
      \ 'async_minlines': 1000,
      \ 'highlight': v:true,
      \ 'trigger': 'n',
      \ 'prefixlen': 1,
      \ 'reverse': v:true,
      \ })


autocmd VimEnter * call g:VimSuggestSetOptions(g:VimSuggest)


 " Vim-gitgutter Config
let g:gitgutter_map_keys = 0
let g:gitgutter_signs=0
let g:gitgutter_preview_win_floating=1
let g:gitgutter_floating_window_options=    {
        \ 'line': 'cursor+1',
        \ 'col': 'cursor',
        \ 'moved': 'any',
        \ 'borderchars': ['─', '│', '─', '│', '┌', '󰊢 ', '┘', '└'],
        \ 'borderhighlight': ['Normal'],
        \ 'highlight': 'Normal',
        \ 'border': [1, 1, 1, 1],
        \ 'padding': [0, 1, 0, 1],
        \ 'maxheight': 20
        \}
    let g:gitgutter_sign_added              = '+'
    let g:gitgutter_sign_modified           = '~'
    let g:gitgutter_sign_removed            = '_'
    let g:gitgutter_sign_removed_first_line = '‾'
    let g:gitgutter_sign_removed_above_and_below = '_¯'
    let g:gitgutter_sign_modified_removed   = '~_'
augroup GitGutterOnSave
    autocmd!
    autocmd BufWritePost * GitGutter
augroup END

highlight GitGutterAdd    guifg=#5faf87
highlight GitGutterChange guifg=#ffd787
highlight GitGutterDelete guifg=#d75f5f

" vim instant markdown
let g:instant_markdown_slow = 1
let g:instant_markdown_mermaid = 0
let g:instant_markdown_theme = 'dark'
let g:instant_markdown_autoscroll = 1

" vim-visual-multi
hi! VM_Mono ctermfg=0 ctermbg=134 guifg=#000000 guibg=#5faf87
hi! link VM_Extend Visual
hi! VM_Cursor ctermfg=0 ctermbg=134 guifg=#000000 guibg=#609CD9
hi! VM_Insert ctermfg=0 ctermbg=134 guifg=#000000 guibg=#9e7cc1
" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Define color variables
let g:StslineColorGreen  = "#5faf87"
let g:StslineColorBlue   = "#609CD9"
let g:StslineColorViolet = "#9e7cc1"
let g:StslineColorYellow = "#D7A542"
let g:StslineColorLight  = "#C0C0C0"
let g:StslineColorDark   = "#080808"
let g:StslineColorDark1  = "#181818"
let g:StslineColorDark2  = "#202020"
let g:StslineColorDark3  = "#303030"


" Define colors
let g:StslineBackColor   = g:StslineColorDark2
let g:StslineOnBackColor = g:StslineColorLight
let g:StslineOnPriColor  = g:StslineColorDark
let g:StslineSecColor    = g:StslineColorDark3
let g:StslineOnSecColor  = g:StslineColorLight


" Create highlight groups
execute 'highlight StslineSecColorFG guifg=' . g:StslineSecColor   ' guibg=' . g:StslineBackColor
execute 'highlight StslineSecColorBG guifg=' . g:StslineColorLight ' guibg=' . g:StslineSecColor
execute 'highlight StslineBackColorBG guifg=' . g:StslineColorLight ' guibg=' . g:StslineBackColor
execute 'highlight StslineBackColorFGSecColorBG guifg=' . g:StslineBackColor ' guibg=' . g:StslineSecColor
execute 'highlight StslineSecColorFGBackColorBG guifg=' . g:StslineSecColor ' guibg=' . g:StslineBackColor
execute 'highlight StslineModColorFG guifg=' . g:StslineColorYellow ' guibg=' . g:StslineBackColor



" Statusline
" Enable statusline and set config for custom Statusline
set laststatus=2
set noshowmode
set termguicolors


" Define active statusline
function! ActivateStatusline()
    call GetFileType()

    if !exists("b:GitBranch")
        let  b:GitBranch = ''
        setlocal statusline=%#StslinePriColorBG#\ %{StslineMode()}%#StslineSecColorBG#%#StslineBackColorFGPriColorBG#%#StslinePriColorFG#\ %{&readonly?\"\ \":\"\"}%F\ %#StslineModColorFG#%{&modified?\"\ \":\"\"}%=%#StslinePriColorFG#\ %{b:FiletypeIcon}%{&filetype}\ %#StslineSecColorFG#%#StslineSecColorBG#%{&fenc!='utf-8'?\"\ \":''}%{&fenc!='utf-8'?&fenc:''}%{&fenc!='utf-8'?\"\ \":''}%#StslinePriColorFGSecColorBG#%#StslinePriColorBG#\ %p\%%\ %#StslinePriColorBGBold#%l%#StslinePriColorBG#/%L\ :%c\ | "This comment prevents the trailing whitespace from being removed
    else
setlocal statusline=%#StslinePriColorBG#\ %{StslineMode()}%#StslineSecColorBG#%{exists('b:GitBranch')\ &&\ b:GitBranch\ !=\ ''\ ?\ \'\ \'.b:GitBranch.'\ '\ :\ ''}%#StslineBackColorFGPriColorBG#%#StslinePriColorFG#\ %{&readonly?\"\ \":\"\"}%F\ %#StslineModColorFG#%{&modified?\"\ \":\"\"}%=%#StslinePriColorFG#\ %{b:FiletypeIcon}%{&filetype}\ %#StslineSecColorFG#%#StslineSecColorBG#%{&fenc!='utf-7'?\"\ \":''}%{&fenc!='utf-8'?&fenc:''}%{&fenc!='utf-8'?\"\ \":''}%#StslinePriColorFGSecColorBG#%#StslinePriColorBG#\ %p\%%\ %#StslinePriColorBGBold#%l%#StslinePriColorBG#/%L\ :%c\ | "This comment prevents the trailing whitespace from being removed
    endif

endfunction


" Define Inactive statusline
function! DeactivateStatusline()
    if !exists("b:GitBranch") || b:GitBranch == ''
        setlocal statusline=%#StslineSecColorBG#\ INACTIVE\ %#StslineSecColorBG#%{b:GitBranch}%#StslineBackColorFGSecColorBG#%#StslineBackColorBG#\ %{&readonly?\"\ \":\"\"}%F\ %#StslineModColorFG#%{&modified?\"\ \":\"\"}%=%#StslineBackColorBG#\ %{b:FiletypeIcon}%{&filetype}\ %#StslineSecColorFGBackColorBG#%#StslineSecColorBG#\ %p\%%\ %l/%L\ :%c\ | "This comment prevents the trailing whitespace from being removed

    else
        setlocal statusline=%#StslineSecColorBG#\ %{b:GitBranch}\ %#StslineBackColorFGSecColorBG#%#StslineBackColorBG#\ %{&readonly?\"\ \":\"\"}%F\ %#StslineModColorFG#%{&modified?\"\ \":\"\"}%=%#StslineBackColorBG#\ %{b:FiletypeIcon}%{&filetype}\ %#StslineSecColorFGBackColorBG#%#StslineSecColorBG#\ %p\%%\ %l/%L\ :%c\ | "This comment prevents the trailing whitespace from being removed
    endif

endfunction

" Get Statusline mode & also set primary color for that mode
function! StslineMode()

    let l:CurrentMode=mode()

    if l:CurrentMode==#"n"
        let g:StslinePriColor     = g:StslineColorGreen
        let b:CurrentMode = "NORMAL "

    elseif l:CurrentMode==#"i"
        let g:StslinePriColor     = g:StslineColorViolet
        let b:CurrentMode = "INSERT "

    elseif l:CurrentMode==#"c"
        let g:StslinePriColor     = g:StslineColorYellow

        let b:CurrentMode = "COMMAND "

    elseif l:CurrentMode==#"v"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "VISUAL "

    elseif l:CurrentMode==#"V"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "V-LINE "

    elseif l:CurrentMode==#"\<C-v>"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "V-BLOCK "

    elseif l:CurrentMode==#"R"
        let g:StslinePriColor     = g:StslineColorViolet
        let b:CurrentMode = "REPLACE "

    elseif l:CurrentMode==#"s"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "SELECT "

    elseif l:CurrentMode==#"t"
        let g:StslinePriColor     =g:StslineColorYellow
        let b:CurrentMode = "TERM "

    elseif l:CurrentMode==#"!"
        let g:StslinePriColor     = g:StslineColorYellow
        let b:CurrentMode = "SHELL "

    endif

    call UpdateStslineColors()

    return b:CurrentMode

endfunction



" Update colors. Recreate highlight groups with new Primary color value.
function! UpdateStslineColors()

execute 'highlight StslinePriColorBG           guifg=' . g:StslineOnPriColor ' guibg=' . g:StslinePriColor
execute 'highlight StslinePriColorBGBold       guifg=' . g:StslineOnPriColor ' guibg=' . g:StslinePriColor ' gui=bold'
execute 'highlight StslinePriColorFG           guifg=' . g:StslinePriColor   ' guibg=' . g:StslineBackColor
execute 'highlight StslinePriColorFGSecColorBG guifg=' . g:StslinePriColor   ' guibg=' . g:StslineSecColor
execute 'highlight StslineSecColorFGPriColorBG guifg=' . g:StslineSecColor   ' guibg=' . g:StslinePriColor

if !exists("b:GitBranch") || b:GitBranch == ''
execute 'highlight StslineBackColorFGPriColorBG guifg=' . g:StslineBackColor ' guibg=' . g:StslinePriColor
endif

endfunction



" Get git branch name
function! GetGitBranch()
let b:GitBranch=''

    if exists('*FugitiveIsGitDir') && FugitiveIsGitDir()
      let l:branch_name = FugitiveHead()
      let [a, m, r] = GitGutterGetHunkSummary()
      let l:hunk_summary = ''
      if a > 0 || m > 0 || r > 0
          let l:hunk_summary = printf(' +%d ~%d -%d', a, m, r)
      endif
      let b:GitBranch = '    ' . l:branch_name . l:hunk_summary
      execute 'highlight StslineBackColorFGPriColorBG guifg=' . g:StslineBackColor . ' guibg=' . g:StslineSecColor
    endif

endfunction



" Get filetype & custom icon. Put your most used file types first for optimized performance.
function! GetFileType()

if &filetype == 'sh' || &filetype == 'zsh'
let b:FiletypeIcon = ' '

elseif &filetype == 'go'
let b:FiletypeIcon = ' '

elseif &filetype == 'cpp'
let b:FiletypeIcon = ' '

elseif &filetype == 'c'
let b:FiletypeIcon = ' '

elseif &filetype == 'vim'
let b:FiletypeIcon = ' '

elseif &filetype == 'html'
let b:FiletypeIcon = ' '

elseif &filetype == 'css'
let b:FiletypeIcon = ' '

elseif &filetype == 'javascript'
let b:FiletypeIcon = ' '

elseif &filetype == 'javascriptreact'
let b:FiletypeIcon = ' '

elseif &filetype == 'markdown'
let b:FiletypeIcon = ' '

elseif &filetype == ''
let b:FiletypeIcon = ''

elseif  &filetype == 'typescript'
let b:FiletypeIcon = ' '

elseif &filetype == 'scss'
let b:FiletypeIcon = ' '

elseif &filetype == 'rust'
let b:FiletypeIcon = ' '

elseif &filetype == 'ruby'
let b:FiletypeIcon = ' '

elseif &filetype == 'lua'
let b:FiletypeIcon = ' '

elseif &filetype == 'haskel'
let b:FiletypeIcon = ' '

else
let b:FiletypeIcon = ' '

endif
endfunction

" Set active / inactive statusline after entering, leaving buffer
augroup SetStslineline
    autocmd!
    autocmd BufEnter,WinEnter * call ActivateStatusline()
    autocmd User GitGutter call GetGitBranch() | call ActivateStatusline()
    autocmd BufLeave,WinLeave * call DeactivateStatusline()

augroup END

" }}}
