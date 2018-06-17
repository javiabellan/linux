#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
# >>> Added by cnchi installer
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano

# Luke prompt
# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi


# Add path for pip installed programs
export PATH="${PATH}:/home/javi/.local/bin"

# Directories
alias dl="cd ~/DL"
alias dl1="cd /home/javi/DL/fastai/courses/dl1"
alias dl2="cd /home/javi/DL/fastai/courses/dl2"
alias ml1="cd /home/javi/DL/fastai/courses/ml1"

# Commands
alias jn="jupyter notebook --browser firefox"
alias ll="ls -al"
alias cpu="htop"
alias gpu="nvidia-smi --query-gpu=fan.speed,temperature.gpu,utilization.gpu,utilization.memory --format=csv -l 1"


alias upgrade='sudo pacman -Syu'    # Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias update='sudo pacman -Sy'      # Refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias install='sudo pacman -S'      # Install specific package(s) from the repositories
alias uninstall='sudo pacman -Rcsn' # Remove the specified package(s), its configuration(s) and unneeded dependencies (parents and chilcdren)
