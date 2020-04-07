# Entra en la Bios (tecla ?)

### Detecta tu sistema
| Bios (or Legacy)        | UEFI                       |
|-------------------------|----------------------------|
| MRB (Master Boot Rcord) | GPT (GUID Partition Table) |
| Antiguo                 | Nuevo                      |

- [ ] Enable UEFI
- [ ] Disable Secure Boot
- [ ] Disable Fast Boot

# 1. Install Windows

# 2. Install [Manjaro](https://manjaro.org/download)

### Arranca desde USB (tecla F12)

- **Driver**
  - **free**: Si no tienes GPU
  - **nonfree**: Si tienes GPU Nvidia (o AMD)

### Particiones

|                           | Size   | Type | File system | Mount point | Flags     |
|---------------------------|--------|------|-------------|-------------|-----------|
| Partición de arranque     | 100 MB | GPT  | fat32       | /boot/efi   | boot, esp |
| Partición SWAP (opcional) | 16 GB  | GPT  | linuxswap   |             | swap      |
| Partición para Manjaro    | Resto  | GPT  | ext4        | /           | root      |



# 3. Prepare Majaro

### Update system
```
sudo pacman -Syu                        # Update and upgrade all packages
```

### Update nvidia driver

```
sudo pacman -S linux54-nvidia-440xx     # Update nvidia driver
sudo mhwd -r pci video-nvidia-418xx
reboot
sudo mhwd -i pci video-nvidia-430xx
reboot
```

### Software
```
su

pacman -S git
pacman -S htop
pacman -S hdf5                       # General purpose library and file format for storing scientific data
pacman -S opencv opencv-samples      # Open Source Computer Vision Library
pacman -S graphviz                   # Graph visualization software

pacman -S python-numpy               # Matrix manipulation
pacman -S python-scipy               # Scientific library for Python. Sparse matrices support
pacman -S python-pandas              # Deal with data
pacman -S python-scikit-learn        # Machine learning
pacman -S python-matplotlib          # Visualization
pacman -S python-seaborn             # Visualization
pacman -S python-nltk                # Natural language processing in Python
pacman -S python-tqdm                # Fast, Extensible Progress Meter
pacman -S python-pytorch-opt-cuda    # Pytorch
pacman -S python-tensorflow-opt-cuda # Tensorflow
```

## Other links

* Learn
  * [Linuxjourney](https://linuxjourney.com/)
* Blogs
  * [Linuxito](https://www.linuxito.com/)
* linux utils
  * [Fedora science programs](https://fedora-scientific.readthedocs.io/en/latest/)
