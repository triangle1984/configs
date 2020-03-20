#Хде находится oh my zsh. Для рута нужно указать вручную
export ZSH="/home/$(whoami)/.oh-my-zsh"

# тема к zsh
ZSH_THEME="agnoster"
# плагины
plugins=(git zsh-syntax-highlighting zsh-autosuggestions sudo lxd-completion-zsh docker)

source $ZSH/oh-my-zsh.sh
clear
# Load the oh-my-zsh's library.
#<---- флаги компиляции ---->
# у меня их нет)0
#<--- алисы ---->
alias pacman="sudo pacman"
alias cp="cp -r"
alias ls="sudo ls --color=auto"
# alias dockers="docker -H ssh://root@193.38.51.77"
# alias dockers-compose="sudo docker-compose -H ssh://root@flafe.org"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"
alias update="sudo pacman -Syy"
alias upgrade="sudo pacman -Syyu"
alias aur="pacaur"
alias gg="git pull"
alias start="sudo systemctl start"
alias gitclone="git clone --depth 1 -b master"
alias stop="sudo systemctl stop"
alias restart="sudo systemctl restart"
alias status="sudo systemctl status"
alias enable="sudo systemctl enable"
alias disable="sudo systemctl disable"
alias lxc="sudo lxc"
alias status="systemctl status"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias e="exit"
alias l="ls"
alias c="clear"
alias la="ls -a"
alias cp="cp -v"
alias modprobe="sudo modprobe -v"
alias mkinitcpio="sudo mkinitcpio -p"
alias mem="watch free -h"
alias temp="watch sensors"
alias rim="sudo rim"
alias f="fuck"
alias powerpill="sudo powerpill"
alias gcc="grc --colour=auto gcc"
alias irclog="grc --colour=auto irclog"
alias log="grc --colour=auto log"
alias egrep="egrep --color=always"
alias gc="gc -a"
alias proftpd="grc --colour=auto proftpd"
alias traceroute="grc --colour=auto traceroute"
alias lias grep="grep --color=auto"
alias pip='sudo pip'
# <---- функции---->A
autoload -Uz compinit 
zstyle ':completion::complete:*' gain-privileges 1
# убийца мать его архивов
ex () {
 if [ -f $1 ] ; then
   case $1 in
     *.tar.bz2) tar xvjf $1   ;;
     *.tar.gz)  tar xvzf $1   ;;
     *.tar.xz)  tar xvfJ $1   ;;
     *.bz2)     bunzip2 $1    ;;
     *.rar)     unrar x $1    ;;
     *.gz)      gunzip $1     ;;
     *.tar)     tar xvf $1    ;;
     *.tbz2)    tar xvjf $1   ;;
     *.tgz)     tar xvzf $1   ;;
     *.zip)     unzip $1      ;;
     *.Z)       uncompress $1 ;;
     *.7z)      7z x $1       ;;
     *)         echo "'$1' ну вот не могу распаковать ваш ёбанный архив" ;;
   esac
 else
   echo "'$1' не буду распаковывать этот хуевый архив"
 fi
}
# ls при переходе в каталог
function chpwd() {
           ls 
        }
gall() {
	git add .
	git commit -m "$@"
	git push
}
cstring() {
	wc -l **/*.py
}
termbin() {
	cat $1 | nc termbin.com 9999 | xclip -selection clipboard && echo "се"
}
s(){
   ssh -l root $1 ${@:2}
}
dockers(){
   ssh -l root 193.38.51.77 docker $@
}
# <--- переменные, иницилизации некоторых утилит ---->
export PATH
unsetopt beep
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=256"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
export EDITOR="vim"
export PYTHONPATH=/home/archie/GLaDOS
export PATH=$PATH:/var/lib/snapd/snap/bin
export GOPATH=~/go
# export TERM=xterm
