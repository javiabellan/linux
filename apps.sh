

########################################## General

pacman -S git                        # Distributed version control system
pacman -S nvidia                     # Nvidia drivers (need reboot)


########################################## Deep learning

pacman -S cuda                       # Nvidia API for GPGPU
pacman -S cudnn                      # Nvidia CUDA Deep Neural Network library
pacman -S python                     # Python 3
pacman -S python-pip                 # The PyPA recommended tool for installing Python packages

pacman -S jupyter-notebook           # Python notebooks
pacman -S python-ipywidgets          # IPython widgets for the Jupyter Notebook

pacman -S python-numpy               # Matrix manipulation
pacman -S python-scipy               # Scientific library for Python. Sparse matrices support
pacman -S python-pandas              # Deal with data
pacman -S python-scikit-learn        # Machine learning
pacman -S python-matplotlib          # Visualization
pacman -S python-seaborn             # Visualization
pacman -S python-nltk                # Natural language processing in Python
pacman -S python-tqdm                # Fast, Extensible Progress Meter

pacman -S hdf5                       # General purpose library and file format for storing scientific data
pacman -S gtkglext                   # opengl extensions for gtk2 (necesario para opencv)
pacman -S opencv opencv-samples      # Open Source Computer Vision Library
pacman -S graphviz                   # Graph visualization software

pacman -S python-pytorch-cuda        # Pytorch
pacman -S python-tensorflow-opt-cuda # Tensorflow
pacman -S tensorflow-opt-cuda        # Tensorflow
pacman -S tensorboard                # Tensorboard

pacman -S r                          # Language and environment for statistics

# It is always preferred to use pacman. 
# If you must use pip, use "pip install --user".
# Add path /home/javi/.local/bin
pip install --user jupyterthemes     # Themes for Jupyter Notebooks
    jt -l                            # list available themes
    jt -t chesterish                 # select theme...
    jt -r                            # restore default theme
pip install --user kaggle            # Kaggle API
pip install --user torchvision       # Image and video datasets and models for torch
pip install --user torchtext         # Data loaders and abstractions for text and NLP 
pip install --user Keras
pip install --user bcolz
pip install --user graphviz          # Interface for python
pip install --user sklearn-pandas
pip install --user pandas-summary    # An extension to pandas describe function.
pip install --user isoweek

pip install --user nltk
pip install --user spacy             # Industrial-Strength Natural Language Processing

AUR: python-torchvision
AUR: python-keras                    # Keras API for Tensorflow
AUR: python-theano
AUR: caffe
AUR: mxnet                           # MXNet: Apache DL
AUR: cntk                            # CNTK:  Microsoft DL



########################################## GUI programs

pacman -S firefox                    # Internet browser
pacman -S vlc                        # Video player
pacman -S corebird                   # Twitter
pacman -S atom                       # A hackable text editor for the 21st Century

curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
pacman -S sublime-text               # Twitter

########################################## Others

adobe-source-sans-pro-fonts
aspell-en
enchant
gst-libav
gst-plugins-good
hunspell-en
icedtea-web
jre8-openjdk
languagetool
libmythes
mythes-en
pkgstats
ttf-anonymous-pro
ttf-bitstream-vera
ttf-dejavu
ttf-droid
ttf-gentium
ttf-liberation
ttf-ubuntu-font-family

########################################## Firewall

# iptables is already installed. I like ufw.

pacman -S ufw                # Install ufw
ufw enable                   # Enable it only once, when package is installed
ufw status verbose           # Check its status
systemctl start ufw          # Start the firewall
systemctl enable ufw         # Enable the start-up with the system [option a]
systemctl enable ufw.service # Enable the start-up with the system [option b]



################################################
########      GRAPHICAL ENVIROMENT      ########
################################################

If you want to use the latest nvidia drivers in the official repository,
you can choose libglvnd (and not nvidia-304xx-utils).

########################################## Xorg

pacman -S xorg-server xorg-xinit
pacman -S xterm                      # Necessary??

# It will read from ~/.xinitrc to know what to start
nano ~/.xinitrc
      exec i3

# You can start X by running:
xinit
startx

ENTER
ENTER

########################################## Display manager (login screen)

# Terminal login screen:
# nano ~/.profile ~/.bash_profile
if [[ "$(tty)" == '/dev/tty1' ]]; then
exec startx
fi

# or use a Display manager (login screen)
pacman -S lightdb lightdm-gtk-greeter
systemctl enable lightdm.service

########################################## Colors

# Colors in terminal for bash, pacman and nano
# https://youtu.be/giAb4Ckh8BQ



# Install i3 window manager
pacman -S i3-gaps i3status rxvt-unicode dmenu

# Other things needed for a wm
nano ~/.xinitrc
# exec i3


# Fonts
pacman -S ttf-linux-libertine ttf-inconsolata
# Or just
pacman -S noto-fonts

# Manually edit
~/.config/fontconfig/fonts.conf


########################################## Gnome


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
