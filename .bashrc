# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

### FUNCTIONS ###

#Extract any archive file, provided by /u/Steelbath on /r/Linux
extract() {
    if [ -z ${1} ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        echo "Usage: extract <archive> [directory]"
        echo "Example: extract presentation.zip."
        echo "Valid archive types are:"
        echo "tar.bz2, tar.gz, tar.xz, tar, bz2, gz, tbz2,"
        echo "tbz, tgz, lzo, rar, zip, 7z, xz, txz, lzma and tlz"
    else
        case "$1" in
            *.tar.bz2|*.tbz2|*.tbz)         tar xvjf "$1" ;;
            *.tgz)                          tar zxvf "$1" ;;
            *.tar.gz)                       tar xvzf "$1" ;;
            *.tar.xz)                       tar xvJf "$1" ;;
            *.tar)                          tar xvf "$1" ;;
            *.rar)                          7z x "$1" ;;
            *.zip)                          unzip "$1" ;;
            *.7z)                           7z x "$1" ;;
            *.lzo)                          lzop -d  "$1" ;;
            *.gz)                           gunzip "$1" ;;
            *.bz2)                          bunzip2 "$1" ;;
            *.Z)                            uncompress "$1" ;;
            *.xz|*.txz|*.lzma|*.tlz)        xz -d "$1" ;;
            *) echo "Sorry, '$1' could not be decompressed." ;;
        esac
    fi
}

mkcd() { mkdir -p "$1" && cd "$1"; }

vp() { 
  if [ -z ${1} ]; then
    echo "vp requires filename."
  elif [ ! -f ${1} ]; then
    echo "File does not exit"
  elif [ -z ${2} ]; then
    cp $1 $1-$(date +%Y-%m-%d.%H:%M:%S).bak && vim $1
  else
    cp $1 $2
  fi
}

### ALIASES ###
alias offrecord='history -d $(history 1)'
alias bashrc='source ~/.bashrc'
alias bashrce='vi ~/.bashrc'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias l='ls -l'
alias ll='ls -AlF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias hg='history | grep '

# Git stuff
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gs='git status'
alias gd='git diff'
alias gf='git fetch'
alias gm='git merge'
alias gr='git rebase'
alias gp='git push'
alias gu='git unstage'
alias gco='git checkout'
alias gb='git branch'

# Dotfile git stuff
alias da='dotfiles add'
alias dc='dotfiles commit'
alias dcm='dotfiles commit -m'
alias dp='dotfiles push'
alias dpu='dotfiles pull'

alias c=clear
alias u='cd ..;'
alias {:q!,:q,q,quit}='exit'
alias please='/usr/bin/sudo $(history -p !!)'
