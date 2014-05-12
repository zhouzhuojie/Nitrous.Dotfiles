# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="terminalparty"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

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
alias ll='ls -alF --group-directories-first'
alias la='ls -A'
alias l='ls -CF'
alias webshare='python ~/Dropbox/Current\ files/webshare.py 8888'
alias search='apt-cache search'
alias install='sudo apt-get install'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias matlab='/usr/local/MATLAB/R2010b/bin/matlab'
alias freerapid='java -jar /home/zzj/Downloads/Installed_Apps/FreeRapid-0.86u1/frd.jar'
alias ssh-x='ssh -c arcfour,blowfish-cbc -XC'
alias htmlrsync='rsync -r ~/Dropbox/Workspace/PythonTest/wisesoc/_build/html ~/Dropbox/Public'
alias aws='cd ~/.ssh && ssh -i wiseagg.pem ubuntu@ec2-23-20-245-232.compute-1.amazonaws.com'
alias engedit="unison /home/zzj/Dropbox/Workspace/PythonTest/engedit ssh://ubuntu@ec2-54-242-188-118.compute-1.amazonaws.com/engedit -sshargs '-i /home/zzj/Dropbox/Personal/engeditorg.pem' -ignore 'Name {*.pyc, .git}'"
alias dropbox-aerofs="rsync -ravz ~/Dropbox/* ~/AeroFS"
alias aerofs-copy="rsync -ravz ~/AeroFS/* ~/Copy"
alias dropbox-copy="rsync -ravz ~/Dropbox/* ~/Copy"
alias python="python2"
alias pip="sudo pip2"

setopt nocorrectall

function s {
        sdcv $1
        python ~/Dropbox/Workspace/PythonTest/bighugelabs/bighugelabs.py $1
}

#256-colour support
export TERM="xterm-256color"
export R_LIBS="/home/zzj/R/library"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
. ~/.nvm/nvm.sh
