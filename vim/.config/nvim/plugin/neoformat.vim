" Enable basic formatting
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

" Python
let g:neoformat_enabled_python = ['autopep8']

" C, C++
let g:neoformat_cpp_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['--style="{IndentWidth: 4}"']
            \}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

" Shell
let g:shfmt_opt="-ci"
let g:neoformat_enabled_shell = ['shfmt']
let g:neoformat_enabled_zsh = ['shfmt']

" Prettier
let g:neoformat_enabled_sol = ['prettier']
let g:neoformat_enabled_md = ['prettier']
