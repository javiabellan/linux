# HARDWARE
# Processor     x86_64
# Min RAM:      512 MB RAM
# Min Space:    800 MB

# SOFTWARE
# User:         root
# Shell:        zsh
# Editors:      nano vi vim


################################################
########      ON WORKING COMPUTER       ########
################################################

# 1. Download iso

# 2. Identify USB pen
lsblk

# 3. Copy iso to pendrive
dd if=Downloads/archlinux.iso of=/dev/sdb status="progress" # very careful with correct "of"

################################################
########        PRE-INTALLATION         ########
################################################

########################################## Keyboard and font

ls /usr/share/kbd/keymaps/**/*.map.gz  # List available keyboards
loadkeys es                            # Set spanish keyboard

ls /usr/share/kbd/consolefonts/        # See fonts
setfont                                # Set font

########################################## Verify Boot mode

# TODO: UEFI vs BIOS
# Mejor usar BIOS

# UEFI mode activated if the directory is populated.
ls /sys/firmware/efi/efivars

########################################## Connect to the Internet

# dhcpcd is activated. Check connection with ping
ping archlinux.org

# Update the system clock
timedatectl set-ntp true

########################################## Partition

# 1) Identify disks
lsblk     # Option 1
fdisk -l  # Option 2

# 2) Particionate a disk (sda, sdb, ...)
# 4 needed partitions:
#   sda                  256G
#   ├─sda1    /boot/efi  200..512 = 256M
#   ├─sda2    [SWAP]     16..32   = 32G
#   ├─sda3    /          25..32   = 32G
#   └─sda4    /home      rest

fdisk /dev/sda  # Option 1
    m       # Help
    p       # Print status
    d       # Delete current partitons
    n       # Create new partition: Boot (200MB)
            #   type: default (primary)
            #   number: default (1)
            #   fisrt sector: default
            #   last sector: +200M
            #   Remove signature: Yes
            #   repeat for rest
    w       #   Write changes
    
parted /dev/sda # Option 2
    mklabel gpt
    mkpart ESP fat32 1MiB 513MiB
    set 1 boot on
    mkpart primary linux-swap 513MiB 4.5GiB
    mkpart primary ext4 4.5GiB 100%

# 3) Format partitions
mkfs.ext4 /dev/sda1  # Boot
mkswap /dev/sda2     # Swap
swapon /dev/sda2     # Swap
mkfs.ext4 /dev/sda3  # Root
mkfs.ext4 /dev/sda4  # Home

# 4) Mount
mount /dev/sda3 /mnt        # Mount root
mkdir /mnt/boot             # Mount boot
mount /dev/sda1 /mnt/boot   # Mount boot
mkdir /mnt/home             # Mount home
mount /dev/sda4 /mnt/home   # Mount home


################################################
########          INTALLATION           ########
################################################

pacstrab /mnt base base-devel

##########################################
# Generate /est/fstab file
genfstab -U /mnt >> /mnt/etc/fstab

########################################## Bootable

# Enter the system
# Command line from pendrive to my system
arch-chroot /mnt

########################################## Time zone

ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
hwclock --systohc

########################################## Locale

# Set th system language

nano /etc/locale.gen
#   Uncomment en_US.UTF-8 UTF-8

locale-gen


nano /etc/locale.conf # (new file)
#   LANG=es_ES.UTF-8
#   LANG=en_US.UTF-8


########################################## Hostname

nano /etc/hostname
#   pc

########################################## Network config

pacman -S networkmanager # install

systemctl enable NetworkManager # Start on boot

########################################## Initramfs

########################################## Root pass

passwd

########################################## Boot loader

pacman -S grub intel-ucode


grub-install --target=x86_64-efi --efi-directory=boot --bootloader-id=grub

# Config
grub-mkconfig -o /boot/grub/grub.cfg


################################################
########        POST-INTALLATION        ########
################################################
Read https://wiki.archlinux.org/index.php/General_recommendations

########################################## Colors

# Colors in terminal for bash, pacman and nano
# https://youtu.be/giAb4Ckh8BQ

########################################## Add user

# useradd -m -g initial_group -G additional_groups -s login_shell username
useradd --create-home archie
passwd archie

useradd -m -g wheel -s /bin/bash $name >/dev/tty6
echo "$name:$pass1" | chpasswd >/dev/tty6

########################################## Install LTS Kernel

# https://youtu.be/b-H3jURTgqk

uname -r                             # Check your current kernel
sudo pacman -S linux-lts             # Install LTS kernel
pacman -R linux                      # [OPTIONAL] Remove the standard kernel 
grub-mkconfig -o /boot/grub/grub.cfg # Reconfigure GRUB
sudo pacman -S linux-lts-headers     # Install LTS headers
sudo reboot                          # Reboot
uname -r                             # Check new current kernel

# Note, for syslinux you'll need to edit the syslinux config file in /boot/syslinux/syslinux.cfg accordingly,
# just point everything to the -lts kernel.

########################################## Install microcode (for Intel)

sudo pacman -S intel-ucode           # Install microcode
grub-mkconfig -o /boot/grub/grub.cfg # Reconfigure GRUB

########################################## Disable GRUB delay

# Add the following to /etc/default/grub:
# achieve the fastest possible boot:
GRUB_FORCE_HIDDEN_MENU="true"

# Then put file 31_hold_shift to /etc/grub.d/.
# Download 31_hold_shift https://goo.gl/nac6Kp

# Make it executable, and regenerate the grub configuration:
sudo chmod a+x /etc/grub.d/31_hold_shift
sudo grub-mkconfig -o /boot/grub/grub.cfg

########################################## Install key packages

sudo pacman -S adobe-source-sans-pro-fonts aspell-en enchant gst-libav gst-plugins-good \
hunspell-en icedtea-web jre8-openjdk languagetool libmythes mythes-en pkgstats \
ttf-anonymous-pro ttf-bitstream-vera ttf-dejavu ttf-droid ttf-gentium ttf-liberation ttf-ubuntu-font-family

########################################## Firewall

sudo pacman -S ufw            # Install ufw
sudo ufw enable               # Enable it
sudo ufw status verbose       # Check its status
sudo systemctl enable ufw.service # Enable the start-up with the system
#Reboot and check the status again. It should be active.

########################################## Encrypt your home directory

########################################## Optimize pacman's database access speeds

sudo pacman-optimize

########################################## Check for errors

sudo systemctl --failed
sudo journalctl -p 3 -xb

########################################## Backup the system

sudo rsync -aAXvP --delete --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/run/* --exclude=/mnt/* --exclude=/media/* --exclude=/lost+found --exclude=/home/.ecryptfs / /mnt/backupDestination/



################################################
########      GRAPHICAL ENVIROMENT      ########
################################################

pacman -S xorg-server xorg-init

# You can start X by running:
xinit
startx
# It will read from ~/.xinitrc to know what to start


# Install i3 window manager
pacman -S i3-gaps i3-status rxvt-unicode dmenu

# Other things needed for a wm
nano ~/.xinitrc
# exec i3


# Fonts
pacman -S ttf-linux-libertine ttf-inconsolata
# Or just
pacman -S noto-fonts

# Manually edit
~/.config/fontconfig/fonts.conf





################################################
########       DEEP LEARNING SETUP      ########
################################################

dialog --backtitle "Deep learning with Arch linux"\
       --title     "Welcome!"\
       --msgbox    "\nThis is the configuration to make your perfect linux distro."\
       8 40


dialog --backtitle "CPU Selection" \
       --radiolist "Select CPU type:" 10 40 4 \
        1 386SX off \
        2 386DX on \
        3 486SX off \
        4 486DX off

########################################## Nvidia drivers

# Identify your card
lspci    | grep -i nvidia
lspci    | grep -e VGA -e 3D
lspci -k | grep -A 2 -i "VGA"

# Install drivers and driver's utils
pacman -S nvidia nvidia-utils

# Reboot

######################################## GPU computation

pacman -S cuda   # Nvidia API for GPGPU
pacman -S cudnn  # Nvidia primitives for Neural Networks
Magma            # Linear Algebra for OpenCL and CUDA and heteregenous many-core systems

######################################## Computation

OpenBLAS + LAPACK # Efficient Matrix computation and Linear Algebra library (alternative MKL)
Numpy             # Matrix Manipulation in Python
Scipy             # General scientific library for Python. Sparse matrices support

######################################## Deep larining frameworks

Pytorch
Theano
Tensorflow
Keras
Mxnet
Nervana Neon, Chainer, DyNet, MinPy





######################################## Other packages

# Monitoring
htop       - Monitor CPU, RAM, load, kill programs
nvidia-smi - Monitor Nvidia GPU

CSV manipulation
xsv - The fastest, multi-processing CSV library. Written in Rust.


    
Rapid Development, Research
Jupyter - Code Python, R, Haskell, Julia with direct feedback in your browser
jupyter_contrib_nbextensions - Extensions for jupyter (commenting code, ...)

Visualization
Matplotlib
Seaborn


