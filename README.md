# .vim

It's my `.vim`! Hooray. It changes often, but in general some notes:

* Stuff uses [Pathogen](https://github.com/tpope/vim-pathogen).
* [the_silver_searcher](https://github.com/ggreer/the_silver_searcher), [jshint](http://www.jshint.com/)
  [git](http://git-scm.com/) are required
* I use [neovim](https://neovim.io/)

homebrew+nodejs bootstrap:

    brew install git macvim the_silver_searcher
    npm install -g jshint

    cd bundle/tern_for_vim
    npm install

    cd bundle/ctrlp-cmatcher
    ./install.sh
