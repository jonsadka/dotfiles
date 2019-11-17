export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Tutotial: https://timothybasanov.com/2016/04/23/zsh-prompt-and-vcs_info.html
# Documentation: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Configuration-1
# Symbols: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
# Colors: https://jonasjacek.github.io/colors/

# Make `vcs_info` available
autoload -Uz vcs_info
# Update each time new prompt is rendered
function precmd() { vcs_info }
# Allow dynamic command promp
setopt prompt_subst
# Show git info in the prompt
if [ $UID -eq 0 ];then
  # PROMPT="%F{203}%n@%m %f%F{cyan}%~%f %% "
  PROMPT='%F{203}%n@%m %f%F{117}${vcs_info_msg_0_}%f %% '
else
  # OSX
  # PROMPT="%F{246}%n@%m %f%F{cyan}%~%f %% "
  PROMPT='%F{246}%n@%m %f%F{117}${vcs_info_msg_0_}%f %% '
fi

# Show full path when outside of git
zstyle ':vcs_info:*' nvcsformats '%~'
# Show "unsubmitted changes" mark
zstyle ':vcs_info:*' check-for-changes true
# Color yellow for unstaged changes:
zstyle ':vcs_info:*' unstagedstr '%F{222}'
# Color red for staged changes
zstyle ':vcs_info:*' stagedstr '%F{203}'
# Show this in git directories
zstyle ':vcs_info:*' formats '%R %F{156}%u%c(%r/%b)'
zstyle ':vcs_info:*' actionformats '%R %F{156}%u%c(%r/%a|%m)'
zstyle ':vcs_info:git:*' patch-format '%10>...>%p%<< (%n applied)'

# Get back the ~ for home
zstyle ':vcs_info:*+set-message:*' hooks home-path
function +vi-home-path() {
  # Replace $HOME with ~
  hook_com[base]="$(echo ${hook_com[base]} | sed "s/${HOME:gs/\//\\\//}/~/" )"
}

zstyle ':vcs_info:git+post-backend:*' hooks git-remote-staged
function +vi-git-remote-staged() {
  # Show "unstaged" when changes are not staged or not committed
  # Show "staged" when last committed is not pushed
  #
  # See original VCS_INFO_get_data_git for implementation details

  # Set "unstaged" when git reports either staged or unstaged changes
  if (( gitstaged || gitunstaged )) ; then
    gitunstaged=1
  fi

  # Set "staged" when current HEAD is not present in the remote branch
  if (( querystaged )) && \
     [[ "$(${vcs_comm[cmd]} rev-parse --is-inside-work-tree 2> /dev/null)" == 'true' ]] ; then
      # Default: off - these are potentially expensive on big repositories
      if ${vcs_comm[cmd]} rev-parse --quiet --verify HEAD &> /dev/null ; then
          gitstaged=1
          if ${vcs_comm[cmd]} status --branch --short | head -n1 | grep -v ahead > /dev/null ; then
            gitstaged=
          fi
      fi
  fi

  hook_com[staged]=$gitstaged
  hook_com[unstaged]=$gitunstaged
}

# Show the timestamp
RPROMPT="%F{246}%*"
