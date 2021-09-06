# vim-unicode-whitespace

This plugin is meant to be minimal way to highlight unicode whitespace
characters in vim. By unicode whitespace I mean characters in unicode category
space that are invisible and do not have other mechanisms of rendering in vim
yet, e.g. listchars `space` and `nbsp` are not included because you can
hightlight them just fine in regular vim.

## Installation

Use [Vundle](https://github.com/VundleVim/Vundle.vim).
(other packagers or manual installation are equally trivial tho).

### Vundle installation

Copypasta:

```
Plugin 'flammie/vim-unicode-whitespace'
```

into your vundle block in your `.vimrc` or equivalent.

## Configuration

Nothing yet. But do supplement with:

```
set list
set lcs=tab:␉-,eol:␤,trail:·,nbsp:␣,extends:»,precedes:«,space=¿
```
to see other space characters, with stand-ins of your choice.

## Acknowledgments

I wrote this from the scratch but got frustrated because `syn match` in my vim
does not seem to work so actually copypasted chunks of the code from
[vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace).

