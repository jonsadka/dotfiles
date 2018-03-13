dotfiles
========

## Terminal
Install brew:`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Install Git and bash-completion: `brew install git bash-completion`

Add `.bash_profile` and `.gitconfig` to root directory (`~/`)

`npm set progress=false` to disable npm progress bar and speed up install

## Visual Studio Code
Extensions:
```
beautify
Brack Pair Colorizer
colorize
Debugger for Chrome
ESLint
Guides
Path Intellisense
Spacegray VSCode
Sublime Text Keymap
vscode-icons
```

## Sublime Text 3

### command line tool (subl)
https://www.sublimetext.com/docs/3/osx_command_line.html
```
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
```

### packages
install package control:
https://sublime.wbond.net/installation

packages:
```
Spacegray (Theme)
Source Code Pro (Font)
Bracket Highlighter
GitGutter

Babel (for React)

CoffeeCompile (for coffeescript)
Better Coffeescript (for coffeescript)
```

### Set sublime as default editor for git
`git config --global core.editor "subl -n -w"`

## Compression utilities

### Zopfli
See http://edupertuis.net/2016/01/12/playing-with-zopfli.html
```
git clone https://github.com/google/zopfli.git
cd zopfli
make zopflipng
sudo mv zopflipng /usr/bin/
```

