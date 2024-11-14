export EDITOR='vim'
export LANG='en_US.UTF-8'

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history
setopt IGNOREEOF
autoload -Uz compinit
compinit

# Android
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"
export PATH="$ANDROID_SDK_ROOT/tools:$PATH"

# Java
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# eza
alias ls='eza'

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

# npm
export PATH="$HOME/.npm-global/bin:$PATH"

# starship
eval "$(starship init zsh)"

# mise
eval "$(mise activate zsh)"
