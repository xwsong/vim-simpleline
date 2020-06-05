" Description: custom your statusline and tabline
" Author: Xiongwei Song<sxwjean@gmail.com>
" Date: 2020.06.05

function! Get_Mode()
    let mode_opts =
        \ {
            \ 'n': 'Normal',
            \ 'no': 'Operator-pending',
            \ 'v': 'visual',
            \ 'V': 'VISUAL',
            \ 'CTRL-V': 'VB',
            \ 'i': 'Insert',
            \ 'R': 'Replace',
            \ 's': 'Select',
            \ 'S': 'Select',
            \ 'CTRL-S': 'Select'
        \ }
    let mode = mode()
    if has_key(mode_opts, mode)
        return mode_opts[mode]
    else
        return "LOVE AND PEACE"
    endif
endfunc

" set status line
" colorscheme will run hi clear, which clear you own color settings so need
" autocmd to keep you color settings
autocmd ColorScheme *
    \ hi User1 ctermbg=238 ctermfg=Red guibg=DarkBlue guifg=Red |
    \ hi User2 ctermbg=238 ctermfg=Yellow guibg=DarkBlue guifg=Red |
    \ hi User3 ctermbg=238 ctermfg=Green guibg=White guifg=DarkBlue |
    \ hi User4 ctermbg=White ctermfg=Blue guibg=DarkBlue guifg=Red |
    \ hi User5 cterm=bold ctermfg=17 ctermbg=190 gui=bold guifg=#00005f guibg=#dfff00 |
    \ hi User6 ctermfg=36 ctermbg=238

set statusline =\ %5*%{Get_Mode()}%*
set statusline+=\ %6*[%-6.100f]%*
set statusline+=\ %2*%r%*
set statusline+=%w
set statusline+=\ %1*%m%*
set statusline+=%=
set statusline+=%l,%c
set statusline+=\ %p%%
" set statusline+=\ %3*%y%*
set statusline+=\ %5*[%{&fileformat}]%*
set statusline+=\ %3*[%{&ft}]%*
set laststatus=2

au ColorScheme * hi! Statusline ctermfg=238 ctermbg=Gray
au ColorScheme * hi! StatuslineNC cterm=bold ctermfg=238 ctermbg=Gray 

" tabline
au ColorScheme * hi User7 cterm=bold ctermfg=79 ctermbg=233
set tabline=\ %7*%-6.100F%*
set showtabline=2
au ColorScheme * hi! TabLineSel term=bold cterm=bold ctermfg=238 ctermbg=190 gui=bold
au ColorScheme * hi! TabLine    term=bold cterm=bold ctermfg=238 ctermbg=190 gui=underline guifg=#00005f guibg=#dfff00
au ColorScheme * hi! TabLineFill term=bold cterm=bold ctermfg=239 ctermbg=238 gui=underline guifg=#00005f guibg=#dfff00
