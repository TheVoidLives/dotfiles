call plug#begin("~/.vim/plugged")

" The OG | Enables help
Plug 'junegunn/vim-plug'

" Theming and usability
Plug 'flazz/vim-colorschemes'
Plug 'nightsense/cosmic_latte'
Plug 'yuttie/hydrangea-vim'
Plug 'dylanaraps/wal.vim'               " Wal integration

" Statusline
Plug 'liuchengxu/eleline.vim'

" QOL
Plug 'junegunn/goyo.vim'                " Focused editor. Focused code. 
Plug 'junegunn/limelight.vim'           " I'm mr meseeks LOOK AT MEEEEEE!

" Version control
Plug 'tpope/vim-fugitive'

" Utility | Navigation
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'airblade/vim-rooter'              " Project directory root
Plug 'tpope/vim-projectionist'          " Vim projects

" Utility | Fuzzy Finding
Plug 'junegunn/fzf' " Should pickup fzf binary if it is on path

" Language Support
Plug 'sheerun/vim-polyglot'                     " Vim multi-lang support
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " IDE Functionality | LSP support

" Extended Text Objects
Plug 'austintaylor/vim-indentobject'    " Indent Object
Plug 'junegunn/vim-easy-align'          " Aligning on text objects

" Editing
Plug 'tpope/vim-abolish'                " Working with word variations (read the doc)
Plug 'tpope/vim-surround'               " Surround text w/ {} [] ()
Plug 'tpope/vim-repeat'                 " Rp
Plug 'tpope/vim-endwise'                " Auto endifs, etc
Plug 'tpope/vim-commentary'             " Comment insertion

" Latex
Plug 'lervag/vimtex'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Utility | Editing | Writing
Plug 'reedes/vim-pencil'
Plug 'junegunn/vim-journal'

" Utility | Building
Plug 'tpope/vim-dispatch'

" Lang Support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
