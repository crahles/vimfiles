require('packer').startup(function()
    use {'Townk/vim-autoclose'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'neoclide/coc.nvim', branch = 'release'}
    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'}
    use {'junegunn/fzf.vim'}
    use {'ggreer/the_silver_searcher'}
    use {
      'autozimu/LanguageClient-neovim',
      branch = 'next', run = 'bash install.sh'
    }
    use {'tpope/vim-commentary'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-surround'}
    use {'mattn/emmet-vim'}
    use {'Yggdroot/indentLine'}
    use {'nvim-lualine/lualine.nvim'}

    use {'nvim-tree/nvim-web-devicons'}

    use {'vim-scripts/DeleteTrailingWhitespace'}
    use {'alvan/vim-closetag'}
    use {'rakr/vim-one'}
    use {'sainnhe/everforest'}
    use {'RRethy/nvim-base16'}
    use {'fatih/vim-go', run = ':GoUpdateBinaries'}
    use {'jgdavey/vim-blockle'}
    use {'kchmck/vim-coffee-script'}
    use {'HerringtonDarkholme/yats.vim'}
    use {'tpope/vim-markdown'}
    use {'leafOfTree/vim-vue-plugin'}
    use {'tpope/vim-rails'}

    use 'rstacruz/vim-closer'
    use {'tpope/vim-endwise'}
end)

