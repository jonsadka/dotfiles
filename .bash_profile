# Make use of the updated npm prefix directory
export PATH="$PATH:$HOME/.npm/bin"

# Number of commands to store in history
HISTFILESIZE=2500

# Bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Bash Auto Complete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

# Add git branch name to terminal prompt
# http://mfitzp.io/article/add-git-branch-name-to-terminal-prompt-mac/
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[36m\]\$(parse_git_branch)\[\033[00m\] $ "

# Increase default process limits (Make sure there are enough file descriptors)
ulimit -n 4096 # large-ish number allowed without sudo
