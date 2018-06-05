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
alias pacinu='pacman -U'              # Install specific local package(s)
alias pacre='pacman -R'               # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacun='pacman -Rcsn'            # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacinfo='pacman -Si'            # Display information about a given package in the repositories
alias pacse='pacman -Ss'              # Search for package(s) in the repositories

alias pacupa='pacman -Sy && sudo abs' # Update and refresh the local package and ABS databases against repositories
alias pacind='pacman -S --asdeps'     # Install given package(s) as dependencies of another package
alias pacclean="pacman -Sc"           # Delete all not currently installed package files
alias pacmake="makepkg -fcsi"         # Make package from PKGBUILD file in current directory
alias changemirror='svim /etc/pacman.d/mirrorlist'
