dotfiles
========

## Terminal
Install brew:`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Add `.zshrc` and `.gitconfig` to root directory (`~/`)
<!-- NOTE: you can add .bash_profile as well but OSX now uses zsh -->

`npm set progress=false` to disable npm progress bar and speed up install

## Compression utilities

### ImageOptim-CLI

Download ImageOptim-CLI and run using
```
% imageoptim '~/<desired/directory/path>' --jpegmini '**/*.jpg'
```

### pngquant
See https://pngquant.org/
```
% git clone git://github.com/kornelski/pngquant.git
% cd pngquant
% sudo make install
```
* By default it will be installed in /usr/local/bin. To install it in another directory run ./configure --prefix=dir && make.

Running (https://stackoverflow.com/questions/9647920/recursively-batch-process-files-with-pngquant)
```
% find . -name '*.png' -print0 | xargs -0 -P8 -L1 pngquant --ext .png --force 256
```

### Zopfli
See https://github.com/google/zopfli
```
% git clone https://github.com/google/zopfli.git
% cd zopfli
% make zopflipng
% sudo mv zopflipng /usr/local/bin/
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


## Visual Studio Code
Extensions:
```
Better Comments
colorize
ESLint
Gitlens
Markdown All in One
One Dark Pro
Prettier (not really using)
Relative Path
Sort lines
Spacegray VSCode (not really using)
```

## Sublime Text 3 (Don't really use anymore)

### command line tool (subl)
https://www.sublimetext.com/docs/3/osx_command_line.html
```
% ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
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
