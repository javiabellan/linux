common: /etc/bash.bashrc
user:   ~/.bashrc
root:   /root/.bashrc

\[     comienza un secuencia de carácteres no imprimibles
\]     termina un secuencia de carácteres no imprimibles

\u     el nombre del usuario actual
\$     si el UID efectivo es 0, un #; en otro caso, $

\w     el directorio actual de trabajo, con el directorio $HOME abreviado con una tilde
\W     el nombre base del directorio actual de trabajo, con el directorio $HOME abreviado con una tilde

\t     la hora actual en formato 24-horas HH:MM:SS
\T     la hora actual en formato 12-horas HH:MM:SS
\@     la hora actual en formato 12-horas AM/PM
\A     la hora actual en formato 24-horas HH:MM

#PS1='[\u@\h \W]\$ '


BLUE   =`tput setf 1`
GREEN  =`tput setf 2`
CYAN   =`tput setf 3`
RED    =`tput setf 4`
MAGENTA=`tput setf 5`
YELLOW =`tput setf 6`
WHITE  =`tput setf 7`

Negro       0;30     Gris Obscuro  1;30
Azul        0;34     Azul Claro    1;34
Verde       0;32     Verde Claro   1;32
Cyan        0;36     Cyan Claro    1;36
Rojo        0;31     Rojo Claro    1;31
Purpura     0;35     Fiuscha       1;35
Café        0;33     Amarillo      1;33
Gris Claro  0;37     Blanco        1;37

PS1   ='\[$GREEN\]\u@\h \[$BLUE\]\w/\[$GREEN\] \$\[$WHITE\] '

# Luke
# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi


############################################################################# ALIASES

##################### Monitoring
alias cpu='htop'


# ver https://www.andrey-melentyev.com/monitoring-gpus.html
watch -n 0.1 nvidia-smi # Si quieres soreescribir encima, en lugar de escribir abajo

nvidia-smi --query-gpu=timestamp,temperature.gpu,utilization.gpu,utilization.memory --format=csv -l 1
nvidia-smi --query-gpu=fan.speed,temperature.gpu,utilization.gpu,utilization.memory --format=csv -l 1

# Para usar en barra
nvidia-smi --query-gpu=memory.used,pstate,temperature.gpu --format=nounits,csv,noheader 
nvidia-smi --query-gpu=utilization.memory --format=csv,noheader # Uso memoria gpu
nvidia-smi --query-gpu=utilization.gpu    --format=csv,noheader # Uso GPU
nvidia-smi --query-gpu=temperature.gpu    --format=csv,noheader # GPU temperature in degrees C.
nvidia-smi --query-gpu=fan.speed          --format=csv,noheader # Fan speed
nvidia-smi --query-gpu=memory.total
nvidia-smi --query-gpu=memory.free
nvidia-smi --query-gpu=memory.used

nvidia-smi pmon                                                      # Procesos usando la GPU (type: G->graphics, C->compute)
watch -n 0.1 'ps f -o user,pgrp,pid,pcpu,pmem,start,time,command -p `sudo lsof -n -w -t /dev/nvidia*`'

nvidia-smi -q -g 0 -d UTILIZATION -l

# Otros
nvidia-settings -q GPUUtilization -q useddedicatedgpumemory
nvtop      AUR


alais mem=''


alias ll='ls -alF'
alias ll='ls -alh'

alias q=’exit’
alias c=’clear’
alias h=’history’
alias cs=’clear;ls’
alias p=’cat’
alias pd=’pwd’
alias lsa=’ls -a’
alias lsl=’ls -l’
alias pd=’pwd’
alias t=’time’
alias k='kill'
alias null=’/dev/null’


PACMAN

alias upgrade='pacman -Syu'           # Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias update='pacman -Sy'             # Refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias install='pacman -S'             # Install specific package(s) from the repositories
alias uninstall='pacman -Rcsn'        # Remove the specified package(s), its configuration(s) and unneeded dependencies (parents and chilcdren)
alias info='pacman -Si'               # Display information about a given package in the repositories
alias search='pacman -Ss'             # Search for package(s) in the repositories (regular expression)

alias pacinu='pacman -U'              # Install specific local package(s)
alias pacre='pacman -R'               # Remove the specified package(s), retaining its configuration(s) and required dependencies


alias pacupa='pacman -Sy && sudo abs' # Update and refresh the local package and ABS databases against repositories
alias pacind='pacman -S --asdeps'     # Install given package(s) as dependencies of another package
alias pacclean="pacman -Sc"           # Delete all not currently installed package files
alias pacmake="makepkg -fcsi"         # Make package from PKGBUILD file in current directory
alias changemirror='svim /etc/pacman.d/mirrorlist'
