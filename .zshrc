export EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history
setopt IGNOREEOF
unsetopt PROMPT_SP
autoload -Uz compinit
compinit

# Fxxk Python 2.x
alias python="python3"
alias python-config="python3-config"
alias pip="pip3"

# Fxxk `git checkout` command
git() {
	if [ "$1" = checkout ]; then
		echo "Use git switch instead!"
		return 1
	fi
	command git "$@"
}

# npm
export NPM_HOME="$HOME/.npm-global"
export PATH="$NPM_HOME/bin:$PATH"

# Android
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"
export PATH="$ANDROID_SDK_ROOT/tools:$PATH"

# Java
export JAVA_HOME=/Applications/"Android Studio.app"/Contents/jbr/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"

# peco
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey "^r" peco-select-history

function peco-get-destination-from-cdr() {
  cdr -l | \
  sed -e "s/^[[:digit:]]*[[:blank:]]*//" | \
  peco --query "$LBUFFER"
}

function peco-cdr() {
  local destination="$(peco-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}
zle -N peco-cdr
bindkey "^u" peco-cdr

# starship
eval "$(starship init zsh)"

# exa
if [[ $(command -v exa) ]]; then
  alias ls="exa --icons --git"
  alias lt="exa -T -L 3 -a -I 'node_modules|.git|.cache' --icons"
  alias ltl="exa -T -L 3 -a -I 'node_modules|.git|.cache' -l --icons"
fi

# asdf
. /usr/local/opt/asdf/libexec/asdf.sh

