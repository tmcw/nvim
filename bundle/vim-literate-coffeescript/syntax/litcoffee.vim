" Language:   Literate CoffeeScript
" Maintainer: Michael Smith <michael@diglumi.com>
" URL:        https://github.com/mintplant/vim-literate-coffeescript
" License:    MIT

runtime! syntax/markdowm.vim

if exists('b:current_syntax') && b:current_syntax == 'litcoffee'
  finish
endif

syn include @markdown syntax/markdown.vim
syn include @coffee syntax/coffee.vim

syn region commentMarkdown start='^' end='$' contains=@markdown
syn region inlineCoffee start='^    \|\t' end='$' contains=@coffee

