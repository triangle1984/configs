#Хде находится oh my zsh. Для рута нужно указать вручную ff
export ZSH="/home/$(whoami)/.oh-my-zsh"

# тема к zsh
ZSH_THEME="agnoster"
# плагины
plugins=(git zsh-syntax-highlighting zsh-autosuggestions sudo)

source $ZSH/oh-my-zsh.sh
#<---- флаги компиляции ---->
# у меня их нет)0
#<--- алисы ---->
clear
alias termbin="nc termbin.com 9999"
alias pacman="sudo pacman"
alias docker="sudo docker"
alias update="sudo pacman -Syy"
alias upgrade="sudo pacman -Syyu"
alias aur="pacaur"
alias start="sudo systemctl start"
alias stop="sudo systemctl stop"
alias restart="sudo systemctl restart"
alias status="sudo systemctl status"
alias enable="sudo systemctl enable"
alias disable="sudo systemctl disable"
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
alias pacman="yay"
#colour
if [ -f /usr/bin/grc ]; then
 alias gcc="grc --colour=auto gcc"
 alias irclog="grc --colour=auto irclog"
 alias log="grc --colour=auto log"
 alias netstat="grc --colour=auto netstat"
 alias ping="grc --colour=auto ping"
 alias proftpd="grc --colour=auto proftpd"
 alias traceroute="grc --colour=auto traceroute"
 alias lias grep="grep --color=auto"
 alias ls='ls --color=auto'
fi
# <---- функции---->A
autoload -Uz compinit 
eval $(thefuck --alias)
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
# неебись шо
zsh_command_time() {
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$(($ZSH_COMMAND_TIME/60))
        sec=$(($ZSH_COMMAND_TIME%60))
        if [ "$ZSH_COMMAND_TIME" -le 60 ]; then
            timer_show="$fg[green]$ZSH_COMMAND_TIME s."
        elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
            timer_show="$fg[yellow]$min min. $sec s."
        else
            if [ "$hours" -gt 0 ]; then
                min=$(($min%60))
                timer_show="$fg[red]$hours h. $min min. $sec s."
            else
                timer_show="$fg[red]$min min. $sec s."
            fi
        fi
        printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show"
    fi
}
# ls при переходе в каталог
function chpwd() {
           ls 
        }
# <--- переменные, иницилизации некоторых утилит ---->
export PATH
unsetopt beep
#python ~/cowsay/cowsay.py samara | lolcat
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=256"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
