"
" Installation
"
if has('nvim')
    "neovim + vim
    let s:jetpackfile = stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
    let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
    if !filereadable(s:jetpackfile)
        call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
    endif
else
    if has( 'unix' )
        let s:vimDir = expand( $HOME ) . "/.vim"
    else
        let s:vimDir = expand( "<sfile>:p:h" )
    endif

    let s:jetpackfile = s:vimDir .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
    let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
    if !filereadable(s:jetpackfile)
        call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
    endif
endif

"
" Plugins
"
packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1} "bootstrap
Jetpack 'https://github.com/dense-analysis/ale'
Jetpack 'junegunn/fzf.vim'
Jetpack 'junegunn/fzf', { 'do': {-> fzf#install()} }
Jetpack 'neoclide/coc.nvim', { 'branch': 'release' }
Jetpack 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Jetpack 'vlime/vlime', { 'rtp': 'vim' }
" Jetpack 'dracula/vim', { 'as': 'dracula' }
Jetpack 'habamax/vim-gruvbit', { 'as': 'gruvbit' }
Jetpack 'tpope/vim-fireplace', { 'for': 'clojure' }
call jetpack#end()

"
" Auto update
"
for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor