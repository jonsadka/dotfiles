source ~/lever/scripts/bash/lever-profile

# Bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Bash Auto Complete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[36m\]\$(parse_git_branch)\[\033[00m\] $ "

# Increase default process limits
ulimit -n 1024
