#!/usr/bin/env bash

##############################################
# 
# https://neurite.github.io/debian-setup/
# http://graphific.github.io/posts/running-a-deep-learning-dream-machine/
#
#############################################



if [ "$(whoami)" == "root" ]; then
  echo "running as root, please run as user you want to have stuff installed as"
  exit 1
fi

# This should be run by the root user
if [[ "${EUID}" -ne 0 ]]; then
    echo "[ERROR] This script must run as root." 1>&2
    exit 1
fi


# Seleccionar fuentes oficiales
echo "deb http://deb.debian.org/debian testing main contrib non-free
deb-src http://deb.debian.org/debian testing main contrib non-free

deb http://deb.debian.org/debian testing-updates main contrib non-free
deb-src http://deb.debian.org/debian testing-updates main contrib non-free

deb http://security.debian.org/debian-security/ testing/updates main contrib non-free
deb-src http://security.debian.org/debian-security/ testing/updates main contrib non-free" >> /etc/apt/sources.list


export DEBIAN_FRONTEND=noninteractive


apt-get -q -y update
apt-get -q -y dist-upgrade
apt-get -q -y autoremove
apt-get -q -y autoclean

apt-cache search linux-image


# Internet
apt-get install curl wget             # Descargar
apt-get install apt-transport-https
apt-get install git                   # git

linux-image-generic
build-essential unzip

# Desarrollo
apt-get install make
apt-get install dpkg-dev  # Desarrollo de paquetes Debian
apt-get install check     # Tests unitarios para C
apt-get install libopenblas-base libopenblas-dev # Álgebra lineal

# Lenguajes
apt-get install gcc libc6-dev                   # C
apt-get install g++                             # C++
apt-get install python  python-dev  python-pip  # python 2
apt-get install python3 python3-dev python3-pip # python 3
apt-get install ruby    ruby-dev                # ruby
apt-get install openjdk-8-jdk openjdk-8-source  # java
apt-get install gfortran                        # Fortran

# NVidia
lspci | grep -i nvidia


Caffe
OpenCV
Theano
Keras
TensorFlow


# Instalar Gnome
apt-get install gdm3                 # The display manager
apt-get install gnome-session        # The session manager
apt-get install gnome-shell          # Gnome shell
apt-get install gnome-keyring libpam-gnome-keyring \
apt-get install network-manager-gnome \
apt-get install pulseaudio           # Audio

# Aplicaciones Gnome
apt-get install nautilus             # Explorador de archivos
apt-get install gnome-terminal       # Aplicación terminal
apt-get install gnome-control-center # Aplicación ajustes
apt-get install gnome-tweak-tool     # Aplicación retoques
apt-get install evince               # Document (PostScript, PDF) viewer
apt-get install gnome-calculator     # Calculadora
apt-get install vlc                  # Reproductor de video VLC


apt-get install software-properties-gtk # Busca actualizaciones de paquetes

# Editores texto
gedit
sublime text



############################################################

# 1) Seleccionar fuentes no oficiales
deb [arch=amd64] https://dl.bintray.com/alanfranz/atom-apt stable main   # Atom Editor
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main      # Google Chrome      ok
deb [arch=amd64] https://repo.skype.com/deb stable main                  # Skype
deb              http://repository.spotify.com stable non-free           # Spotify
deb [arch=amd64] http://repo.steampowered.com/steam/ precise steam       # Steam
deb              https://download.sublimetext.com/ apt/stable/           # Sublime Text       ok
deb              https://download.sublimetext.com/ apt/dev/              # Sublime Text (dev) ok
deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main # Visual Studio Code

# 2) Obtener claves GPG de los repositorios no oficiales
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -  # Google Chrome
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg  | sudo apt-key add -  # Sublime Text

# 3) Instalar 
apt-get install google-chrome-stable

################################################################
