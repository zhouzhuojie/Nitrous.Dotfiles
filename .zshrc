ZSH=$HOME/.oh-my-zsh
ZSH_THEME="minimal_improved"
plugins=(history-substring-search)
source $ZSH/oh-my-zsh.sh
# RPROMPT=''

# Customize to your needs...
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# some more ls aliases
alias ls='exa'
alias ll='ls -alhF --group-directories-first --git'
alias la='ls -A'
alias gbr='git branch | grep -v "master" | xargs git branch -D'
alias k='kubectl'
alias kk='kube-prompt'
alias lo='buffalo'
alias cadence="docker run --rm ubercadence/cli:master --address host.docker.internal:7933"
alias tctl="docker run --network=host --rm temporalio/tctl:0.21.1"

setopt nocorrectall

export TERM="xterm-256color"
export GPG_TTY=$(tty)
export KEYTIMEOUT=1
export R_LIBS="/home/zzj/R/library"
eval "$(rbenv init -)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export PATH=$PATH:$HOME/.cargo/bin
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
