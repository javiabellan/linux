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

# UEFI mode activated if the directory is populated.
ls /sys/firmware/efi/efivars

########################################## Connect to the Internet

# dhcpcd is activated. Check connection with ping
ping archlinux.org

# Update the system clock
timedatectl set-ntp true

########################################## Partition

# Identify disks
fdisk -l  # Option 1
lsblk     # Option 2

# Particionate a disk (sda, sdb, ...)
fdisk /dev/sda  # Option 1
parted /dev/sda # Option 2

# 3 needed partitions:
#   sda
#   ├─sda1    /
#   ├─sda2    /boot/efi
#   └─sda3    [SWAP]

# Format partitions
mkfs.ext4 /dev/sda1  # Root
mkswap /dev/sda3     # Swap
swapon /dev/sda3     # Swap

# Mount
mount /dev/sda1 /mnt        # Mount root
mkdir /mnt/boot             # Mount boot
mount /dev/sda2 /mnt/boot   # Mount boot

##########################################

##########################################

##########################################

##########################################

##########################################

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


