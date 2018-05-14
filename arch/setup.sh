# HARDWARE
# Processor     x86_64
# Min RAM:      512 MB RAM
# Min Space:    800 MB

# SOFTWARE
# User:         root
# Shell:        zsh
# Editors:      nano vi vim

######################################### ON WORKING COMPUTER

# 1. Download iso

# 2. Identify USB pen
lsblk

# 3. Copy iso to pendrive
dd if=Downloads/archlinux.iso of=/dev/sdb status="progress" # very careful with correct "of"


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

########################################## Install

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

##########################################
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


