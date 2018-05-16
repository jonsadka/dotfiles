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
One Dark Pro
Relative Path
Spacegray VSCode
```

## Sublime Text 3

### command line tool (subl)
https://www.sublimetext.com/docs/3/osx_command_line.html
```
$ ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
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
See https://github.com/google/zopfli
```
$ git clone https://github.com/google/zopfli.git
$ cd zopfli
$ make zopflipng
$ sudo mv zopflipng /usr/local/bin/
```

Running (http://edupertuis.net/2016/01/12/playing-with-zopfli.html)
```
#!/bin/bash
mkdir compressed
for file in ./*.png
do
  zopflipng "${file}" compressed/$(basename "${file}")
done
```

### pngquant
See https://pngquant.org/
```
$ git clone git://github.com/kornelski/pngquant.git
$ cd pngquant
$ sudo make install
```
* By default it will be installed in /usr/local/bin. To install it in another directory run ./configure --prefix=dir && make.

Running (https://stackoverflow.com/questions/9647920/recursively-batch-process-files-with-pngquant)
```
$find . -name '*.png' -print0 | xargs -0 -P8 -L1 pngquant --ext .png --force 256
```
